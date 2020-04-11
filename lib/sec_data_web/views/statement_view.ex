defmodule SecDataWeb.StatementView do
  use SecDataWeb, :view
  alias SecDataWeb.StatementView

  def render("index.json", %{statements: statements}) do
    %{data: render_many(statements, StatementView, "show.json")}
  end

  def render("show.json", %{statement: statement}) do
    %{data: render_one(statement, NumericView, "statement.json")}
  end

  def render("statement.json", %{statement: statement}) do
    %{
      cik: statement.cik,
      form: statement.form,
      fy: statement.fy,
      fp: statement.fp,
      adsh: statement.adsh,
      report: statement.report,
      line: statement.line,
      stmt: statement.stmt,
      inpth: statement.inpth,
      rfile: statement.rfile,
      tag: statement.tag,
      version: statement.version,
      plabel: statement.plabel,
      ddate: statement.ddate,
      qtrs: statement.qtrs,
      uom: statement.uom,
      coreg: statement.coreg,
      value: statement.value,
      footnote: statement.footnote,
      abstract: statement.abstract,
      crdr: statement.crdr,
      custom: statement.custom,
      datatype: statement.datatype,
      doc: statement.doc,
      iord: statement.iord,
      tlabel: statement.tlabel
    }
  end
end
