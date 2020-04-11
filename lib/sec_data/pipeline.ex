defmodule SecData.Pipeline do
  alias SecData.Folders
  alias SecData.FinancialData
  alias SecData.Companies.Company
  alias SecData.Pipeline.Downloader
  alias SecData.Pipeline.FileExtractor

  alias SecData.Statements.{Numeric, Submission, Presentation, Tag}

  def process_all() do
    download_and_import_sec_data()
    download_and_import_tickers()
    vacuum_tables()
  end

  def vacuum_tables() do
    schemas = [%Company{}, %Submission{}, %Presentation{}, %Tag{}, %Numeric{}]

    Enum.each(schemas, fn schema ->
      table = Ecto.get_meta(schema, :source)

      Ecto.Adapters.SQL.query(
        SecData.Repo,
        "VACUUM (ANALYZE) public.#{table}",
        [],
        timeout: 2 * 60 * 60 * 1000
      )
    end)
  end

  def download_and_import_tickers() do
    # Ticker to CIK lookup
    url = "https://www.sec.gov/include/ticker.txt"
    destination = Folders.downloads(url)
    {:ok, downloaded} = Downloader.download_file(url, destination)

    # Add a header
    FileExtractor.process_file(Company, downloaded, headers: ["ticker", "cik"])

    Ecto.Adapters.SQL.query(
      SecData.Repo,
      "UPDATE companies
        SET name = submissions.name
        FROM
          submissions
        WHERE
          companies.cik = submissions.cik"
    )
  end

  def download_and_import_sec_data() do
    FinancialData.update_datasets()

    FinancialData.list_unprocessed_datasets()
    |> Flow.from_enumerable()
    # |> Flow.partition()
    |> Flow.map(&download_dataset/1)
    |> Flow.map(&unzip_folder/1)
    |> Flow.map(&extract_statement/1)
    |> Flow.map(&mark_complete/1)
    |> Flow.run()
  end

  defp mark_complete({dataset, {:error, _message}}), do: FinancialData.delete_dataset(dataset)
  defp mark_complete(dataset), do: FinancialData.mark_completed(dataset)

  defp extract_statement({dataset, {:error, message}}), do: {dataset, {:error, message}}

  defp extract_statement({dataset, files}) do
    Enum.each(files, fn file ->
      case Path.basename(file) |> to_charlist() do
        ~c'sub.txt' ->
          FileExtractor.process_file(Submission, file)

        ~c'tag.txt' ->
          FileExtractor.process_file(Tag, file)

        ~c'pre.txt' ->
          FileExtractor.process_file(Presentation, file)

        ~c'num.txt' ->
          FileExtractor.process_file(Numeric, file)

        ~c'readme.htm' ->
          nil
      end

      File.rm(file)
    end)

    files
    |> List.first()
    |> Path.dirname()
    |> File.rmdir!()

    dataset
  end

  defp download_dataset(dataset) do
    url = dataset.url
    dataset = FinancialData.mark_started(dataset)
    download_folder = Folders.downloads(url)
    downloaded_file = Downloader.download_file(url, download_folder)

    {dataset, downloaded_file}
  end

  defp unzip_folder({dataset, {:error, message}}), do: {dataset, {:error, message}}

  defp unzip_folder({dataset, {:ok, zip_file}}) do
    zip_file = zip_file |> to_charlist()
    temp_dir = Folders.extracts(zip_file) |> to_charlist()

    with {:ok, files} <- :zip.unzip(zip_file, [{:cwd, temp_dir}]) do
      {dataset, files}
    else
      message -> {dataset, {:error, message}}
    end
  end
end
