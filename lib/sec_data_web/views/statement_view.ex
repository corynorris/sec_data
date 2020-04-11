defmodule SecDataWeb.StatementView do
  use SecDataWeb, :view
  alias SecDataWeb.StatementView

  ## Numeric View
  def render("numerics.json", %{numerics: numerics}) do
    %{data: render_many(numerics, StatementView, "numeric.json", as: :numeric)}
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

  ## Presentation View
  def render("presentations.json", %{presentations: presentations}) do
    %{data: render_many(presentations, StatementView, "presentation.json", as: :presentation)}
  end

  def render("presentation.json", %{presentation: presentation}) do
    %{
      adsh: presentation.adsh,
      report: presentation.report,
      line: presentation.line,
      stmt: presentation.stmt,
      inpth: presentation.inpth,
      rfile: presentation.rfile,
      tag: presentation.tag,
      version: presentation.version,
      plabel: presentation.plabel,
      ddate: presentation.ddate,
      qtrs: presentation.qtrs,
      uom: presentation.uom,
      coreg: presentation.coreg,
      value: presentation.value,
      footnote: presentation.footnote,
      abstract: presentation.abstract,
      crdr: presentation.crdr,
      custom: presentation.custom,
      datatype: presentation.datatype,
      doc: presentation.doc,
      iord: presentation.iord,
      tlabel: presentation.tlabel
    }
  end

  ## Full Statement View
  def render("statements.json", %{statements: statements}) do
    %{data: render_many(statements, StatementView, "statement.json", as: :statement)}
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
