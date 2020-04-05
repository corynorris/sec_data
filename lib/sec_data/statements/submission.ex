defmodule SecData.Statements.Submission do
  use Ecto.Schema
  import Ecto.Changeset

  schema "submissions" do
    field :detail, :boolean, default: false
    field :mas1, :string
    field :zipba, :string
    field :stprinc, :string
    field :prevrpt, :boolean, default: false
    field :former, :string
    field :filed, SecDate
    field :cityma, :string
    field :changed, :string
    field :ein, :integer
    field :bas2, :string
    field :instance, :string
    field :countryba, :string
    field :sic, :integer
    field :form, :string
    field :wksi, :boolean, default: false
    field :bas1, :string
    field :countryma, :string
    field :zipma, :string
    field :afs, :string
    field :name, :string
    field :baph, :string
    field :aciks, :string
    field :fp, :string
    field :fye, :string
    field :cityba, :string
    field :mas2, :string
    field :nciks, :integer
    field :stprba, :string
    field :adsh, :string
    field :fy, FiscalPeriod
    field :period, SecDate
    field :countryinc, :string
    field :stprma, :string
    field :accepted, :utc_datetime
    field :cik, :integer

    timestamps()
  end

  @doc false
  def changeset(submission, attrs) do
    submission
    |> cast(attrs, [
      :adsh,
      :cik,
      :name,
      :sic,
      :countryba,
      :stprba,
      :cityba,
      :zipba,
      :bas1,
      :bas2,
      :baph,
      :countryma,
      :stprma,
      :cityma,
      :zipma,
      :mas1,
      :mas2,
      :countryinc,
      :stprinc,
      :ein,
      :former,
      :changed,
      :afs,
      :wksi,
      :fye,
      :form,
      :period,
      :fy,
      :fp,
      :filed,
      :accepted,
      :prevrpt,
      :detail,
      :instance,
      :nciks,
      :aciks
    ])
    |> validate_required([
      :adsh,
      :cik,
      :name,
      :countryba,
      :cityba,
      :countryinc,
      :wksi,
      :fye,
      :form,
      :period,
      :fy,
      :fp,
      :filed,
      :accepted,
      :prevrpt,
      :detail,
      :instance,
      :nciks
    ])
  end
end
