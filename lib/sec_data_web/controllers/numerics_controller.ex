defmodule SecDataWeb.NumericController do
  use SecDataWeb, :controller

  alias SecData.Statements

  action_fallback SecDataWeb.FallbackController

  def show(conn, %{"submission_id" => adsh}) do
    numerics = Statements.list_numerics(adsh)
    render(conn, "index.json", numerics: numerics)
  end
end
