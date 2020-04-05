defmodule SecData.Repo.Migrations.CreateNumerics do
  use Ecto.Migration

  def change do
    create table(:numerics) do
      add :adsh, :string
      add :tag, :string
      add :version, :string
      add :ddate, :date
      add :qtrs, :integer
      add :uom, :string
      add :coreg, :string
      add :value, :float
      add :footnote, :string, size: 512
    end

    create unique_index(:numerics, [:adsh, :tag, :version, :ddate, :qtrs, :uom, :coreg])
  end
end
