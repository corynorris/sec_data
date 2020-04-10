defmodule SecData.FinancialData do
  @moduledoc """
  The Datasets context.
  """
  use Timex

  import Ecto.Query, warn: false
  alias SecData.Repo
  alias SecData.FinancialData.Dataset

  @start_date ~D[2009-01-01]

  def list_datasets() do
    Repo.all(Dataset)
  end

  def delete_dataset(%Dataset{} = datasets) do
    Repo.delete(datasets)
  end

  def mark_started(%Dataset{} = dataset) do
    dataset
    |> Ecto.Changeset.change(started_at: DateTime.truncate(Timex.now(), :second))
    |> Repo.update!()
  end

  def mark_completed(%Dataset{} = dataset) do
    dataset
    |> Ecto.Changeset.change(completed_at: DateTime.truncate(Timex.now(), :second))
    |> Repo.update!()
  end

  def list_unprocessed_datasets() do
    Repo.all(
      from x in Dataset,
        where: is_nil(x.completed_at),
        order_by: x.url
    )
  end

  def update_datasets() do
    generate_datasets()
    |> filter_existing()
    |> create_all()
  end

  defp generate_datasets() do
    @start_date
    |> quarters(Timex.now())
    |> Enum.map(&to_dataset/1)
  end

  defp filter_existing(all_datasets) do
    existing_urls = Repo.all(Dataset) |> Enum.map(&Map.get(&1, :url))
    Enum.reject(all_datasets, &Enum.member?(existing_urls, &1.url))
  end

  defp create_all(datasets) do
    Enum.map(datasets, &Repo.insert/1)
  end

  defp to_dataset(date) do
    formatted_date = "#{Timex.format!(date, "%Y", :strftime)}q#{Timex.quarter(date)}"

    %Dataset{
      url:
        "https://www.sec.gov/files/dera/data/financial-statement-data-sets/#{formatted_date}.zip"
    }
  end

  defp quarters(start_date, end_date) do
    start_date = Timex.beginning_of_quarter(start_date)

    [from: start_date, until: end_date, right_open: false, step: [months: 3]]
    |> Interval.new()
  end
end
