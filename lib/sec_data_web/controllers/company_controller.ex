defmodule SecDataWeb.CompanyController do
  use SecDataWeb, :controller

  alias SecData.Companies
  alias SecData.Companies.Company

  action_fallback SecDataWeb.FallbackController

  def index(conn, params) do
    companies = Companies.list_companies(params)
    render(conn, "index.json", companies: companies)
  end

  def show(conn, %{"id" => id}) do
    company = Companies.get_company!(id)
    render(conn, "show.json", company: company)
  end

  def search(conn, %{"term" => term}) do
    companies = Companies.search_companies(term)
    render(conn, "index.json", companies: companies)
  end
end
