defmodule SecDataWeb.SubmissionView do
  use SecDataWeb, :view
  alias SecDataWeb.SubmissionView

  def render("index.json", %{submissions: submissions}) do
    %{data: render_many(submissions, SubmissionView, "submission.json")}
  end

  def render("show.json", %{submission: submission}) do
    %{data: render_one(submission, SubmissionView, "submission.json")}
  end

  def render("submission.json", %{submission: submission}) do
    %{
      detail: submission.detail,
      mas1: submission.mas1,
      zipba: submission.zipba,
      stprinc: submission.stprinc,
      prevrpt: submission.prevrpt,
      former: submission.former,
      filed: submission.filed,
      cityma: submission.cityma,
      changed: submission.changed,
      ein: submission.ein,
      bas2: submission.bas2,
      instance: submission.instance,
      countryba: submission.countryba,
      sic: submission.sic,
      form: submission.form,
      wksi: submission.wksi,
      bas1: submission.bas1,
      countryma: submission.countryma,
      zipma: submission.zipma,
      afs: submission.afs,
      name: submission.name,
      baph: submission.baph,
      aciks: submission.aciks,
      fp: submission.fp,
      fye: submission.fye,
      cityba: submission.cityba,
      mas2: submission.mas2,
      nciks: submission.nciks,
      stprba: submission.stprba,
      adsh: submission.adsh,
      fy: submission.fy,
      period: submission.period,
      countryinc: submission.countryinc,
      stprma: submission.stprma,
      accepted: submission.accepted,
      cik: submission.cik
    }
  end
end
