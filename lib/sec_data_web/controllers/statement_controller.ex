defmodule SecDataWeb.StatementController do
  use SecDataWeb, :controller

  alias SecData.Statements

  action_fallback SecDataWeb.FallbackController

  def index(conn, %{"company_id" => cik}) do
    statements = Statements.list_statements_by_cik(cik)
    render(conn, "index.json", statements: statements)
  end

  def show(conn, %{"submission_id" => adsh}) do
    statements = Statements.list_statements_by_adsh(adsh)
    render(conn, "index.json", statements: statements)
  end
end
