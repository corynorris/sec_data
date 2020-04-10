defmodule SecData.Statements.Tag do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tags" do
    field(:tag, :string)
    field :abstract, :boolean, default: false
    field :crdr, CreditDebit
    field :custom, :boolean, default: false
    field :datatype, :string
    field :doc, :string
    field :iord, :string
    field :tlabel, :string
    field :version, :string
  end

  @doc false
  def changeset(tag, attrs) do
    tag
    |> cast(attrs, [:tag, :version, :custom, :abstract, :datatype, :iord, :crdr, :tlabel, :doc])
    |> validate_required([:tag, :version, :custom, :abstract])
  end
end
