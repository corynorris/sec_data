defmodule SecDataWeb.TagView do
  use SecDataWeb, :view
  alias SecDataWeb.TagView

  def render("index.json", %{companies: companies}) do
    %{data: render_many(companies, TagView, "tag.json")}
  end

  def render("show.json", %{tag: tag}) do
    %{data: render_one(tag, TagView, "tag.json")}
  end

  def render("tag.json", %{tag: tag}) do
    %{
      tag: tag.tag,
      abstract: tag.abstract,
      crdr: tag.crdr,
      custom: tag.custom,
      datatype: tag.datatype,
      doc: tag.doc,
      iord: tag.iord,
      tlabel: tag.tlabel,
      version: tag.version
    }
  end
end
