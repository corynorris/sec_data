defmodule SecData.Repo do
  use Ecto.Repo,
    otp_app: :sec_data,
    adapter: Ecto.Adapters.Postgres

  use Scrivener, page_size: 1000
end
