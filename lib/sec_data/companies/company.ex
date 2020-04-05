defmodule SecData.Companies.Company do
  use Ecto.Schema
  import Ecto.Changeset

  schema "companies" do
    field :business, :string
    field :cik, :integer
    field :exchange, :string
    field :industry, :string
    field :irs_number, :integer
    field :name, :string
    field :ticker, :string

    timestamps()
  end

  @doc false
  def changeset(company, attrs) do
    company
    |> cast(attrs, [:cik, :name, :ticker, :exchange, :business, :industry, :irs_number])
    |> validate_required([:cik, :name, :ticker, :exchange, :business, :industry, :irs_number])
  end
end
