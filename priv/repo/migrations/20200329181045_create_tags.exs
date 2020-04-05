defmodule SecData.Repo.Migrations.CreateTags do
  use Ecto.Migration

  def change do
    create table(:tags) do
      add :tag, :string
      add :version, :string
      add :custom, :boolean, default: false, null: false
      add :abstract, :boolean, default: false, null: false
      add :datatype, :string
      add :iord, :string
      add :crdr, CreditDebit.type()
      add :tlabel, :string, size: 512
      add(:doc, :string, size: 4096)
    end

    create unique_index(:tags, [:tag, :version])
  end
end
