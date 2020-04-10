defmodule SecDataWeb.SubmissionController do
  use SecDataWeb, :controller

  alias SecData.Statements

  action_fallback SecDataWeb.FallbackController

  def index(conn, %{"company_id" => cik}) do
    submissions = Statements.list_submissions(cik)
    render(conn, "index.json", submissions: submissions)
  end
end
