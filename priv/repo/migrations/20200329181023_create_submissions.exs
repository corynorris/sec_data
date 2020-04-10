defmodule SecData.Repo.Migrations.CreateSubmissions do
  use Ecto.Migration

  def change do
    create table(:submissions, primary_key: false) do
      add :adsh, :string, primary_key: true
      add :cik, :bigint
      add :name, :string
      add :sic, :integer
      add :countryba, :string
      add :stprba, :string
      add :cityba, :string
      add :zipba, :string
      add :bas1, :string
      add :bas2, :string
      add :baph, :string
      add :countryma, :string
      add :stprma, :string
      add :cityma, :string
      add :zipma, :string
      add :mas1, :string
      add :mas2, :string
      add :countryinc, :string
      add :stprinc, :string
      add :ein, :bigint
      add :former, :string
      add :changed, :string
      add :afs, :string
      add :wksi, :boolean, default: false, null: false
      add :fye, :string
      add :form, :string
      add :period, :date
      add :fy, :integer
      add :fp, FiscalPeriod.type()
      add :filed, :date
      add :accepted, :utc_datetime
      add :prevrpt, :boolean, default: false, null: false
      add :detail, :boolean, default: false, null: false
      add :instance, :string
      add :nciks, :integer
      add :aciks, :string
    end

    create unique_index(:submissions, :adsh)
  end
end
