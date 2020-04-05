defmodule SecData.StatementsTest do
  use SecData.DataCase

  alias SecData.Statements

  describe "submissions" do
    alias SecData.Statements.Submission

    @valid_attrs %{cik: 42, accepted: "2010-04-17T14:00:00Z", stprma: "some stprma", countryinc: "some countryinc", period: ~D[2010-04-17], fy: 42, adsh: "some adsh", stprba: "some stprba", nciks: 42, mas2: "some mas2", cityba: "some cityba", fye: "some fye", fp: "some fp", aciks: "some aciks", baph: "some baph", name: "some name", afs: "some afs", zipma: "some zipma", countryma: "some countryma", bas1: "some bas1", wksi: true, form: "some form", sic: 42, countryba: "some countryba", instance: "some instance", bas2: "some bas2", ein: 42, changed: "some changed", cityma: "some cityma", filed: ~D[2010-04-17], former: "some former", prevrpt: true, stprinc: "some stprinc", zipba: "some zipba", mas1: "some mas1", detail: true}
    @update_attrs %{cik: 43, accepted: "2011-05-18T15:01:01Z", stprma: "some updated stprma", countryinc: "some updated countryinc", period: ~D[2011-05-18], fy: 43, adsh: "some updated adsh", stprba: "some updated stprba", nciks: 43, mas2: "some updated mas2", cityba: "some updated cityba", fye: "some updated fye", fp: "some updated fp", aciks: "some updated aciks", baph: "some updated baph", name: "some updated name", afs: "some updated afs", zipma: "some updated zipma", countryma: "some updated countryma", bas1: "some updated bas1", wksi: false, form: "some updated form", sic: 43, countryba: "some updated countryba", instance: "some updated instance", bas2: "some updated bas2", ein: 43, changed: "some updated changed", cityma: "some updated cityma", filed: ~D[2011-05-18], former: "some updated former", prevrpt: false, stprinc: "some updated stprinc", zipba: "some updated zipba", mas1: "some updated mas1", detail: false}
    @invalid_attrs %{cik: nil, accepted: nil, stprma: nil, countryinc: nil, period: nil, fy: nil, adsh: nil, stprba: nil, nciks: nil, mas2: nil, cityba: nil, fye: nil, fp: nil, aciks: nil, baph: nil, name: nil, afs: nil, zipma: nil, countryma: nil, bas1: nil, wksi: nil, form: nil, sic: nil, countryba: nil, instance: nil, bas2: nil, ein: nil, changed: nil, cityma: nil, filed: nil, former: nil, prevrpt: nil, stprinc: nil, zipba: nil, mas1: nil, detail: nil}

    def submission_fixture(attrs \\ %{}) do
      {:ok, submission} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Statements.create_submission()

      submission
    end

    test "list_submissions/0 returns all submissions" do
      submission = submission_fixture()
      assert Statements.list_submissions() == [submission]
    end

    test "get_submission!/1 returns the submission with given id" do
      submission = submission_fixture()
      assert Statements.get_submission!(submission.id) == submission
    end

    test "create_submission/1 with valid data creates a submission" do
      assert {:ok, %Submission{} = submission} = Statements.create_submission(@valid_attrs)
      assert submission.detail == true
      assert submission.mas1 == "some mas1"
      assert submission.zipba == "some zipba"
      assert submission.stprinc == "some stprinc"
      assert submission.prevrpt == true
      assert submission.former == "some former"
      assert submission.filed == ~D[2010-04-17]
      assert submission.cityma == "some cityma"
      assert submission.changed == "some changed"
      assert submission.ein == 42
      assert submission.bas2 == "some bas2"
      assert submission.instance == "some instance"
      assert submission.countryba == "some countryba"
      assert submission.sic == 42
      assert submission.form == "some form"
      assert submission.wksi == true
      assert submission.bas1 == "some bas1"
      assert submission.countryma == "some countryma"
      assert submission.zipma == "some zipma"
      assert submission.afs == "some afs"
      assert submission.name == "some name"
      assert submission.baph == "some baph"
      assert submission.aciks == "some aciks"
      assert submission.fp == "some fp"
      assert submission.fye == "some fye"
      assert submission.cityba == "some cityba"
      assert submission.mas2 == "some mas2"
      assert submission.nciks == 42
      assert submission.stprba == "some stprba"
      assert submission.adsh == "some adsh"
      assert submission.fy == 42
      assert submission.period == ~D[2010-04-17]
      assert submission.countryinc == "some countryinc"
      assert submission.stprma == "some stprma"
      assert submission.accepted == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert submission.cik == 42
    end

    test "create_submission/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Statements.create_submission(@invalid_attrs)
    end

    test "update_submission/2 with valid data updates the submission" do
      submission = submission_fixture()
      assert {:ok, %Submission{} = submission} = Statements.update_submission(submission, @update_attrs)
      assert submission.detail == false
      assert submission.mas1 == "some updated mas1"
      assert submission.zipba == "some updated zipba"
      assert submission.stprinc == "some updated stprinc"
      assert submission.prevrpt == false
      assert submission.former == "some updated former"
      assert submission.filed == ~D[2011-05-18]
      assert submission.cityma == "some updated cityma"
      assert submission.changed == "some updated changed"
      assert submission.ein == 43
      assert submission.bas2 == "some updated bas2"
      assert submission.instance == "some updated instance"
      assert submission.countryba == "some updated countryba"
      assert submission.sic == 43
      assert submission.form == "some updated form"
      assert submission.wksi == false
      assert submission.bas1 == "some updated bas1"
      assert submission.countryma == "some updated countryma"
      assert submission.zipma == "some updated zipma"
      assert submission.afs == "some updated afs"
      assert submission.name == "some updated name"
      assert submission.baph == "some updated baph"
      assert submission.aciks == "some updated aciks"
      assert submission.fp == "some updated fp"
      assert submission.fye == "some updated fye"
      assert submission.cityba == "some updated cityba"
      assert submission.mas2 == "some updated mas2"
      assert submission.nciks == 43
      assert submission.stprba == "some updated stprba"
      assert submission.adsh == "some updated adsh"
      assert submission.fy == 43
      assert submission.period == ~D[2011-05-18]
      assert submission.countryinc == "some updated countryinc"
      assert submission.stprma == "some updated stprma"
      assert submission.accepted == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert submission.cik == 43
    end

    test "update_submission/2 with invalid data returns error changeset" do
      submission = submission_fixture()
      assert {:error, %Ecto.Changeset{}} = Statements.update_submission(submission, @invalid_attrs)
      assert submission == Statements.get_submission!(submission.id)
    end

    test "delete_submission/1 deletes the submission" do
      submission = submission_fixture()
      assert {:ok, %Submission{}} = Statements.delete_submission(submission)
      assert_raise Ecto.NoResultsError, fn -> Statements.get_submission!(submission.id) end
    end

    test "change_submission/1 returns a submission changeset" do
      submission = submission_fixture()
      assert %Ecto.Changeset{} = Statements.change_submission(submission)
    end
  end

  describe "tags" do
    alias SecData.Statements.Tag

    @valid_attrs %{abstract: true, crdr: "some crdr", custom: true, datatype: "some datatype", doc: "some doc", iord: "some iord", tlabel: "some tlabel", version: "some version"}
    @update_attrs %{abstract: false, crdr: "some updated crdr", custom: false, datatype: "some updated datatype", doc: "some updated doc", iord: "some updated iord", tlabel: "some updated tlabel", version: "some updated version"}
    @invalid_attrs %{abstract: nil, crdr: nil, custom: nil, datatype: nil, doc: nil, iord: nil, tlabel: nil, version: nil}

    def tag_fixture(attrs \\ %{}) do
      {:ok, tag} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Statements.create_tag()

      tag
    end

    test "list_tags/0 returns all tags" do
      tag = tag_fixture()
      assert Statements.list_tags() == [tag]
    end

    test "get_tag!/1 returns the tag with given id" do
      tag = tag_fixture()
      assert Statements.get_tag!(tag.id) == tag
    end

    test "create_tag/1 with valid data creates a tag" do
      assert {:ok, %Tag{} = tag} = Statements.create_tag(@valid_attrs)
      assert tag.abstract == true
      assert tag.crdr == "some crdr"
      assert tag.custom == true
      assert tag.datatype == "some datatype"
      assert tag.doc == "some doc"
      assert tag.iord == "some iord"
      assert tag.tlabel == "some tlabel"
      assert tag.version == "some version"
    end

    test "create_tag/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Statements.create_tag(@invalid_attrs)
    end

    test "update_tag/2 with valid data updates the tag" do
      tag = tag_fixture()
      assert {:ok, %Tag{} = tag} = Statements.update_tag(tag, @update_attrs)
      assert tag.abstract == false
      assert tag.crdr == "some updated crdr"
      assert tag.custom == false
      assert tag.datatype == "some updated datatype"
      assert tag.doc == "some updated doc"
      assert tag.iord == "some updated iord"
      assert tag.tlabel == "some updated tlabel"
      assert tag.version == "some updated version"
    end

    test "update_tag/2 with invalid data returns error changeset" do
      tag = tag_fixture()
      assert {:error, %Ecto.Changeset{}} = Statements.update_tag(tag, @invalid_attrs)
      assert tag == Statements.get_tag!(tag.id)
    end

    test "delete_tag/1 deletes the tag" do
      tag = tag_fixture()
      assert {:ok, %Tag{}} = Statements.delete_tag(tag)
      assert_raise Ecto.NoResultsError, fn -> Statements.get_tag!(tag.id) end
    end

    test "change_tag/1 returns a tag changeset" do
      tag = tag_fixture()
      assert %Ecto.Changeset{} = Statements.change_tag(tag)
    end
  end

  describe "numerics" do
    alias SecData.Statements.Numeric

    @valid_attrs %{adsh: "some adsh", coreg: "some coreg", ddate: ~D[2010-04-17], footnote: "some footnote", qtrs: 42, tag: "some tag", uom: "some uom", value: 120.5, version: "some version"}
    @update_attrs %{adsh: "some updated adsh", coreg: "some updated coreg", ddate: ~D[2011-05-18], footnote: "some updated footnote", qtrs: 43, tag: "some updated tag", uom: "some updated uom", value: 456.7, version: "some updated version"}
    @invalid_attrs %{adsh: nil, coreg: nil, ddate: nil, footnote: nil, qtrs: nil, tag: nil, uom: nil, value: nil, version: nil}

    def numeric_fixture(attrs \\ %{}) do
      {:ok, numeric} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Statements.create_numeric()

      numeric
    end

    test "list_numerics/0 returns all numerics" do
      numeric = numeric_fixture()
      assert Statements.list_numerics() == [numeric]
    end

    test "get_numeric!/1 returns the numeric with given id" do
      numeric = numeric_fixture()
      assert Statements.get_numeric!(numeric.id) == numeric
    end

    test "create_numeric/1 with valid data creates a numeric" do
      assert {:ok, %Numeric{} = numeric} = Statements.create_numeric(@valid_attrs)
      assert numeric.adsh == "some adsh"
      assert numeric.coreg == "some coreg"
      assert numeric.ddate == ~D[2010-04-17]
      assert numeric.footnote == "some footnote"
      assert numeric.qtrs == 42
      assert numeric.tag == "some tag"
      assert numeric.uom == "some uom"
      assert numeric.value == 120.5
      assert numeric.version == "some version"
    end

    test "create_numeric/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Statements.create_numeric(@invalid_attrs)
    end

    test "update_numeric/2 with valid data updates the numeric" do
      numeric = numeric_fixture()
      assert {:ok, %Numeric{} = numeric} = Statements.update_numeric(numeric, @update_attrs)
      assert numeric.adsh == "some updated adsh"
      assert numeric.coreg == "some updated coreg"
      assert numeric.ddate == ~D[2011-05-18]
      assert numeric.footnote == "some updated footnote"
      assert numeric.qtrs == 43
      assert numeric.tag == "some updated tag"
      assert numeric.uom == "some updated uom"
      assert numeric.value == 456.7
      assert numeric.version == "some updated version"
    end

    test "update_numeric/2 with invalid data returns error changeset" do
      numeric = numeric_fixture()
      assert {:error, %Ecto.Changeset{}} = Statements.update_numeric(numeric, @invalid_attrs)
      assert numeric == Statements.get_numeric!(numeric.id)
    end

    test "delete_numeric/1 deletes the numeric" do
      numeric = numeric_fixture()
      assert {:ok, %Numeric{}} = Statements.delete_numeric(numeric)
      assert_raise Ecto.NoResultsError, fn -> Statements.get_numeric!(numeric.id) end
    end

    test "change_numeric/1 returns a numeric changeset" do
      numeric = numeric_fixture()
      assert %Ecto.Changeset{} = Statements.change_numeric(numeric)
    end
  end

  describe "presentations" do
    alias SecData.Statements.Presentation

    @valid_attrs %{adsh: "some adsh", inpth: true, line: 42, plabel: "some plabel", report: 42, rfile: "some rfile", stmt: "some stmt", tag: "some tag", version: "some version"}
    @update_attrs %{adsh: "some updated adsh", inpth: false, line: 43, plabel: "some updated plabel", report: 43, rfile: "some updated rfile", stmt: "some updated stmt", tag: "some updated tag", version: "some updated version"}
    @invalid_attrs %{adsh: nil, inpth: nil, line: nil, plabel: nil, report: nil, rfile: nil, stmt: nil, tag: nil, version: nil}

    def presentation_fixture(attrs \\ %{}) do
      {:ok, presentation} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Statements.create_presentation()

      presentation
    end

    test "list_presentations/0 returns all presentations" do
      presentation = presentation_fixture()
      assert Statements.list_presentations() == [presentation]
    end

    test "get_presentation!/1 returns the presentation with given id" do
      presentation = presentation_fixture()
      assert Statements.get_presentation!(presentation.id) == presentation
    end

    test "create_presentation/1 with valid data creates a presentation" do
      assert {:ok, %Presentation{} = presentation} = Statements.create_presentation(@valid_attrs)
      assert presentation.adsh == "some adsh"
      assert presentation.inpth == true
      assert presentation.line == 42
      assert presentation.plabel == "some plabel"
      assert presentation.report == 42
      assert presentation.rfile == "some rfile"
      assert presentation.stmt == "some stmt"
      assert presentation.tag == "some tag"
      assert presentation.version == "some version"
    end

    test "create_presentation/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Statements.create_presentation(@invalid_attrs)
    end

    test "update_presentation/2 with valid data updates the presentation" do
      presentation = presentation_fixture()
      assert {:ok, %Presentation{} = presentation} = Statements.update_presentation(presentation, @update_attrs)
      assert presentation.adsh == "some updated adsh"
      assert presentation.inpth == false
      assert presentation.line == 43
      assert presentation.plabel == "some updated plabel"
      assert presentation.report == 43
      assert presentation.rfile == "some updated rfile"
      assert presentation.stmt == "some updated stmt"
      assert presentation.tag == "some updated tag"
      assert presentation.version == "some updated version"
    end

    test "update_presentation/2 with invalid data returns error changeset" do
      presentation = presentation_fixture()
      assert {:error, %Ecto.Changeset{}} = Statements.update_presentation(presentation, @invalid_attrs)
      assert presentation == Statements.get_presentation!(presentation.id)
    end

    test "delete_presentation/1 deletes the presentation" do
      presentation = presentation_fixture()
      assert {:ok, %Presentation{}} = Statements.delete_presentation(presentation)
      assert_raise Ecto.NoResultsError, fn -> Statements.get_presentation!(presentation.id) end
    end

    test "change_presentation/1 returns a presentation changeset" do
      presentation = presentation_fixture()
      assert %Ecto.Changeset{} = Statements.change_presentation(presentation)
    end
  end
end
