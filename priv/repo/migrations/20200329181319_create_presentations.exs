defmodule SecData.Repo.Migrations.CreatePresentations do
  use Ecto.Migration

  def change do
    create table(:presentations) do
      add :adsh, :string
      add :report, :integer
      add :line, :integer
      add :stmt, FinancialStatement.type()
      add :inpth, :boolean, default: false, null: false
      add :rfile, :string
      add :tag, :string
      add :version, :string
      add :plabel, :string, size: 512
    end

    create unique_index(:presentations, [:adsh, :report, :line])
  end
end
