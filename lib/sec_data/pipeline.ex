defmodule SecData.Pipeline do
  alias SecData.FinancialData
  alias SecData.Pipeline.FileExtraction
  alias SecData.Statements.{Numeric, Submission, Presentation, Tag}

  def test() do
    # file = "/home/cory/Downloads/2019q4/num.txt"
    # FileExtraction.process_file(Numeric, file)

    file = "/home/cory/Downloads/2019q4/sub.txt"
    FileExtraction.process_file(Submission, file)

    file = "/home/cory/Downloads/2019q4/tag.txt"
    FileExtraction.process_file(Tag, file)

    file = "/home/cory/Downloads/2019q4/pre.txt"
    FileExtraction.process_file(Presentation, file)
  end

  def download_all() do
    FinancialData.list_()
  end
end
