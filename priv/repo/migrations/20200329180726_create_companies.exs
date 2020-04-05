defmodule SecData.Repo.Migrations.CreateCompanies do
  use Ecto.Migration

  def change do
    create table(:companies) do
      add :cik, :integer
      add :name, :string
      add :ticker, :string
      add :exchange, :string
      add :business, :string
      add :industry, :string
      add :irs_number, :integer
    end
  end
end
