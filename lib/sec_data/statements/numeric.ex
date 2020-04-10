defmodule SecData.Statements.Numeric do
  use Ecto.Schema
  import Ecto.Changeset

  schema "numerics" do
    field :adsh, :string
    field :coreg, :string
    field :ddate, SecDate
    field :footnote, :string
    field :qtrs, :integer
    field :tag, :string
    field :uom, :string
    field :value, :float
    field :version, :string
  end

  @doc false
  def changeset(numeric, attrs) do
    numeric
    |> cast(attrs, [:adsh, :tag, :version, :ddate, :qtrs, :uom, :coreg, :value, :footnote])
    |> validate_required([:adsh, :tag, :version, :ddate, :qtrs, :uom])
  end
end
