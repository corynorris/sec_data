defmodule SecData.Statements do
  @moduledoc """
  The Statements context.
  """

  import Ecto.Query, warn: false
  alias SecData.Repo

  alias SecData.Statements.Numeric
  alias SecData.Statements.Submission
  alias SecData.Statements.Presentation
  alias SecData.Statements.Statement
  alias SecData.Statements.Tag

  def list_submissions(cik) do
    query =
      from s in Submission,
        where: s.cik == ^cik

    Repo.all(query)
  end

  def list_numerics(adsh) do
    query =
      from n in Numeric,
        where: n.adsh == ^adsh

    Repo.all(query)
  end

  def list_presentations(adsh) do
    query =
      from p in Presentation,
        where: p.adsh == ^adsh

    Repo.all(query)
  end

  def list_statements_by_cik(cik) do
    query =
      from s in Submission,
        join: p in Presentation,
        on: s.adsh == p.adsh,
        join: n in Numeric,
        on: p.adsh == n.adsh and p.tag == n.tag and p.version == n.version,
        join: t in Tag,
        on: p.tag == t.tag and p.version == t.version,
        where:
          s.period == n.ddate and s.cik == ^cik and (s.form == "10-Q" or s.form == "10-K") and
            not is_nil(t.iord),
        select: %Statement{
          cik: s.cik,
          form: s.form,
          fy: s.fy,
          fp: s.fp,
          adsh: p.adsh,
          report: p.report,
          line: p.line,
          stmt: p.stmt,
          inpth: p.inpth,
          rfile: p.rfile,
          tag: p.tag,
          version: p.version,
          plabel: p.plabel,
          ddate: n.ddate,
          qtrs: n.qtrs,
          uom: n.uom,
          coreg: n.coreg,
          value: n.value,
          footnote: n.footnote,
          abstract: t.abstract,
          crdr: t.crdr,
          custom: t.custom,
          datatype: t.datatype,
          doc: t.doc,
          iord: t.iord,
          tlabel: t.tlabel
        }

    Repo.all(query)
  end

  def list_statements_by_adsh(adsh) do
    query =
      from s in Submission,
        join: p in Presentation,
        on: s.adsh == p.adsh,
        join: n in Numeric,
        on: p.adsh == n.adsh and p.tag == n.tag and p.version == n.version,
        join: t in Tag,
        on: p.tag == t.tag and p.version == t.version,
        where: s.period == n.ddate and s.adsh == ^adsh,
        select: %Statement{
          cik: s.cik,
          form: s.form,
          fy: s.fy,
          fp: s.fp,
          adsh: p.adsh,
          report: p.report,
          line: p.line,
          stmt: p.stmt,
          inpth: p.inpth,
          rfile: p.rfile,
          tag: p.tag,
          version: p.version,
          plabel: p.plabel,
          ddate: n.ddate,
          qtrs: n.qtrs,
          uom: n.uom,
          coreg: n.coreg,
          value: n.value,
          footnote: n.footnote,
          abstract: t.abstract,
          crdr: t.crdr,
          custom: t.custom,
          datatype: t.datatype,
          doc: t.doc,
          iord: t.iord,
          tlabel: t.tlabel
        }

    Repo.all(query)
  end
end
