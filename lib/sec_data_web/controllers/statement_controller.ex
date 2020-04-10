defmodule SecDataWeb.StatementController do
  use SecDataWeb, :controller

  alias SecData.Statements

  action_fallback SecDataWeb.FallbackController

  def presentations(conn, %{"submission_id" => adsh}) do
    presentations = Statements.list_presentations(adsh)
    render(conn, "presentations.json", presentations: presentations)
  end

  def numerics(conn, %{"submission_id" => adsh}) do
    numerics = Statements.list_numerics(adsh)
    render(conn, "numerics.json", numerics: numerics)
  end
end
