defmodule SecData.Companies.Company do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:cik, :integer, []}
  @derive {Phoenix.Param, key: :cik}
  schema "companies" do
    field :exchange, :string
    field :industry, :string
    field :name, :string
    field :ticker, :string
  end

  @doc false
  def changeset(company, attrs) do
    company
    |> cast(attrs, [:cik, :name, :ticker, :exchange, :industry])
    |> validate_required([:cik, :ticker])
  end
end
