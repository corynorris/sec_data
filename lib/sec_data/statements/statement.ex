defmodule SecData.Statements.Statement do
  use Ecto.Schema
  import Ecto.Changeset

  embedded_schema do
    # Presentation
    field :inpth, :boolean, default: false
    field :line, :integer
    field :plabel, :string
    field :report, :integer
    field :rfile, :string
    field :stmt, FinancialStatement

    # Numerics
    field :adsh, :string
    field :coreg, :string
    field :ddate, SecDate
    field :footnote, :string
    field :qtrs, :integer
    field :tag, :string
    field :uom, :string
    field :value, :float
    field :version, :string

    # Tags
    field :abstract, :boolean, default: false
    field :crdr, CreditDebit
    field :custom, :boolean, default: false
    field :datatype, :string
    field :doc, :string
    field :iord, :string
    field :tlabel, :string
  end

  @doc false
  def changeset(statement, attrs) do
    statement
    |> cast(attrs, [
      :adsh,
      :inpth,
      :line,
      :plabel,
      :report,
      :rfile,
      :stmt,
      :tag,
      :version,
      :coreg,
      :ddate,
      :footnote,
      :qtrs,
      :uom,
      :value,
      :abstract,
      :crdr,
      :custom,
      :datatype,
      :doc,
      :iord,
      :tlabel
    ])
  end
end
