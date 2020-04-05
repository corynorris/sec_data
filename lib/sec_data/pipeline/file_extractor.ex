defmodule SecData.Pipeline.FileExtraction do
  alias Ecto.Changeset
  alias SecData.Repo

  def is_ok?({:ok, _}), do: true
  def is_ok?(_), do: false
  def valid_changeset?(%Changeset{valid?: true}), do: true
  def valid_changeset?(%Changeset{valid?: false}), do: false

  def process_file(schema, file_name) do
    file_name
    |> File.stream!()
    |> decode_rows()
    |> apply_changeset(schema)
    |> Stream.chunk_every(1000)
    |> Stream.each(&process_batch(&1, schema))
    |> Stream.run()
  end

  defp decode_rows(stream) do
    stream
    |> Stream.with_index()
    |> Stream.transform({true}, &add_headers/2)
    |> Stream.map(&line_to_map/1)
  end

  defp line_to_map({line, _index, headers}) do
    data = parse_line(line)
    {:ok, headers |> Enum.zip(data) |> Enum.into(%{})}
  end

  # {:ok, headers |> Enum.zip(data) |> Enum.into(%{})}
  defp parse_line(line) do
    line
    |> String.trim()
    |> String.split("\t")
  end

  defp add_headers({line, 0}, {headers}) when is_list(headers) do
    {[{line, 0, headers}], {headers}}
  end

  defp add_headers({line, 0}, {true}) do
    {[], {parse_line(line)}}
  end

  defp add_headers({line, index}, {headers}) do
    {[{line, index, headers}], {headers}}
  end

  ## Need to remove invalid records and insert them into a log
  def process_batch(records, schema) do
    {valid, error} =
      records
      |> Enum.split_with(&valid_changeset?/1)

    IO.inspect(error)
    insert_all = Enum.map(valid, fn %Changeset{changes: changes} -> changes end)

    Repo.insert_all(schema, insert_all, on_conflict: :nothing)
  end

  # Never used since I only ever return ok from line parsing
  defp apply_changeset(_schema, {:error, msg}), do: {:error, msg}

  defp apply_changeset(schema, {:ok, attrs}) do
    schema
    |> struct!()
    |> schema.changeset(attrs)
  end

  defp apply_changeset(stream, schema) do
    Stream.map(stream, &apply_changeset(schema, &1))
  end
end
