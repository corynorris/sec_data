defmodule SecDataWeb.DatasetController do
  use SecDataWeb, :controller

  alias SecData.FinancialData

  action_fallback SecDataWeb.FallbackController

  def index(conn, _params) do
    datasets = FinancialData.list_datasets()
    render(conn, "index.json", datasets: datasets)
  end
end
