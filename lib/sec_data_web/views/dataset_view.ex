defmodule SecDataWeb.DatasetView do
  use SecDataWeb, :view
  alias SecDataWeb.DatasetView

  def render("index.json", %{datasets: datasets}) do
    %{data: render_many(datasets, DatasetView, "dataset.json")}
  end

  def render("show.json", %{dataset: dataset}) do
    %{data: render_one(dataset, DatasetView, "dataset.json")}
  end

  def render("dataset.json", %{dataset: dataset}) do
    %{
      url: dataset.url,
      started_at: dataset.started_at,
      completed_at: dataset.completed_at
    }
  end
end
