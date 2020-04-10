defmodule SecData.Pipeline.Downloader do
  use Tesla

  plug(Tesla.Middleware.Retry,
    delay: 10,
    max_retries: 3,
    max_delay: 4_000,
    should_retry: fn
      {:ok, %{status: status}} when status in [400, 500] -> true
      {:ok, _} -> false
      {:error, _} -> true
    end
  )

  plug(Middleware.RateLimit,
    scale: 1000,
    limit: 1
  )

  def download_file(url, filename) do
    if File.exists?(filename) do
      {:ok, filename}
    else
      do_download(url, filename)
    end
  end

  defp do_download(url, filename) do
    with {:ok, %Tesla.Env{body: body, status: 200}} <- get(url),
         :ok <- File.write(filename, body) do
      {:ok, filename}
    else
      _error -> {:error, "Wasn't able to download file"}
    end
  end
end
