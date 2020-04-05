defmodule SecDate do
  use Ecto.Type
  def type, do: :map

  # Provide custom casting rules.
  # Cast strings into the URI struct to be used at runtime
  def cast(datestring) when is_bitstring(datestring) do
    parsed = Timex.parse(datestring, "{YYYY}{0M}{0D}")

    case parsed do
      {:ok, date} -> {:ok, Timex.to_date(date)}
      error -> error
    end
  end

  # Everything else is a failure though
  def cast(_), do: :error

  # When loading data from the database, as long as it's a map,
  # we just put the data back into an URI struct to be stored in
  # the loaded schema struct.
  def load(data) do
    {:ok, data}
  end

  # When dumping data to the database, we *expect* an URI struct
  # but any value could be inserted into the schema struct at runtime,
  # so we need to guard against them.
  def dump(date), do: {:ok, date}
end
