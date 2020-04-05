defmodule SecData.Repo.Migrations.CreateDatasets do
  use Ecto.Migration

  def change do
    create table(:datasets) do
      add :url, :string
      add :started_at, :naive_datetime
      add :completed_at, :naive_datetime
    end

    create unique_index(:datasets, [:url])
  end
end
