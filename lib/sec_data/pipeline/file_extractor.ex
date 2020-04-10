defmodule SecData.Pipeline.FileExtractor do
  alias Ecto.Changeset
  alias SecData.Repo
  require Logger

  @defaults [
    headers: true
  ]

  def process_file(schema, file_name, opts \\ []) do
    context = %{
      headers: Keyword.get(opts, :headers, @defaults[:headers])
    }

    file_name
    |> File.stream!()
    |> decode_rows(context)
    |> apply_changeset(schema)
    |> Stream.chunk_every(1000)
    |> Stream.each(&process_batch(&1, schema))
    |> Stream.run()
  end

  defp decode_rows(stream, context) do
    stream
    |> Stream.with_index()
    |> Stream.transform({context.headers}, &add_headers/2)
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
    |> Strip.strip_utf()
    |> String.split("\t")
  end

  # Match first line and use the list of headers
  defp add_headers({line, 0}, {headers}) when is_list(headers) do
    {[{line, 0, headers}], {headers}}
  end

  # If true is provided just use the first line as headers
  defp add_headers({line, 0}, {true}) do
    {[], {parse_line(line)}}
  end

  defp add_headers({line, index}, {headers}) do
    {[{line, index, headers}], {headers}}
  end

  defp valid_changeset?(%Changeset{valid?: true}), do: true
  defp valid_changeset?(%Changeset{valid?: false}), do: false

  def process_batch(records, schema) do
    {valid, error} = Enum.split_with(records, &valid_changeset?/1)
    Enum.each(error, &Logger.warn("From #{schema} Changeset error: #{inspect(&1)}"))
    valid_changes = Enum.map(valid, fn %Changeset{changes: changes} -> changes end)
    do_insert_all(schema, valid_changes)
  end

  defp do_insert_all(schema, records) do
    try do
      Repo.insert_all(schema, records, on_conflict: :nothing)
    rescue
      _ in Postgrex.Error ->
        remaining = length(records)

        if remaining > 1 do
          len = (remaining / 2) |> round
          [first_half, second_half] = Enum.chunk_every(records, len)
          do_insert_all(schema, first_half)
          do_insert_all(schema, second_half)
        else
          Logger.error("From #{schema} database error inserting: #{inspect(records)}")
        end
    end
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
