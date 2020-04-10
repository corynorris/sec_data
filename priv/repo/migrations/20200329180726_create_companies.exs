defmodule SecData.Repo.Migrations.CreateCompanies do
  use Ecto.Migration

  def change do
    create table(:companies, primary_key: false) do
      add :cik, :bigint, primary_key: true
      add :name, :string
      add :ticker, :string
      add :exchange, :string
      add :industry, :string
    end
  end
end
