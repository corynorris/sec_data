defmodule SecData.FinancialData.Dataset do
  use Ecto.Schema
  import Ecto.Changeset

  schema "datasets" do
    field :completed_at, :utc_datetime
    field :started_at, :utc_datetime
    field :url, :string
  end

  @doc false
  def changeset(dataset, attrs) do
    dataset
    |> cast(attrs, [:url, :started_at, :completed_at])
    |> validate_required([:url])
  end
end
