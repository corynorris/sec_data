defmodule SecData.Statements.Presentation do
  use Ecto.Schema
  import Ecto.Changeset

  schema "presentations" do
    field :adsh, :string
    field :inpth, :boolean, default: false
    field :line, :integer
    field :plabel, :string
    field :report, :integer
    field :rfile, :string
    field :stmt, FinancialStatement
    field :tag, :string
    field :version, :string

    timestamps()
  end

  @doc false
  def changeset(presentation, attrs) do
    presentation
    |> cast(attrs, [:adsh, :report, :line, :stmt, :inpth, :rfile, :tag, :version, :plabel])
  end
end
