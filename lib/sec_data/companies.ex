defmodule SecData.Companies do
  @moduledoc """
  The Companies context.
  """

  import Ecto.Query, warn: false
  alias SecData.Repo

  alias SecData.Companies.Company

  @doc """
  Returns the list of companies.

  ## Examples

      iex> list_companies()
      [%Company{}, ...]

  """
  def search_companies(term) do
    cleaned_term = Regex.replace(~r/([\%_])/, term, "")
    like = "#{cleaned_term}%"

    query =
      from c in Company,
        where: ilike(c.ticker, ^like) and not is_nil(c.name),
        limit: 100,
        order_by: [asc: :name]

    Repo.all(query)
  end

  @doc """
  Returns the list of companies.

  ## Examples

      iex> list_companies()
      [%Company{}, ...]

  """
  def list_companies(params) do
    query =
      from c in Company,
        where: not is_nil(c.name),
        order_by: [asc: :name]

    Repo.paginate(query, params)
  end

  @doc """
  Gets a single company.

  Raises `Ecto.NoResultsError` if the Company does not exist.

  ## Examples

      iex> get_company!(123)
      %Company{}

      iex> get_company!(456)
      ** (Ecto.NoResultsError)

  """
  def get_company!(id), do: Repo.get!(Company, id)
end
