defmodule SecData.Folders do
  def extracts(url) do
    temp_folder = Path.basename(url, ".zip")

    with extract_folder <- Application.app_dir(:sec_data, ["data", temp_folder]),
         :ok <- File.mkdir_p!(extract_folder) do
      extract_folder
    end
  end

  # https://www.sec.gov/files/dera/data/financial-statement-data-sets/2019q4.zip
  def downloads(url) do
    file = Path.basename(url)

    with download_folder <- Application.app_dir(:sec_data, "data"),
         :ok <- File.mkdir_p!(download_folder) do
      Path.join(download_folder, file)
    end
  end
end
