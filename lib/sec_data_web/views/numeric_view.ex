defmodule SecDataWeb.NumericView do
  use SecDataWeb, :view
  alias SecDataWeb.NumericView

  def render("index.json", %{companies: companies}) do
    %{data: render_many(companies, NumericView, "numeric.json")}
  end

  def render("show.json", %{numeric: numeric}) do
    %{data: render_one(numeric, NumericView, "numeric.json")}
  end

  def render("numeric.json", %{numeric: numeric}) do
    %{
      id: numeric.id,
      adsh: numeric.adsh,
      coreg: numeric.coreg,
      ddate: numeric.ddate,
      footnote: numeric.footnote,
      qtrs: numeric.qtrs,
      tag: numeric.tag,
      uom: numeric.uom,
      value: numeric.value,
      version: numeric.version
    }
  end
end
