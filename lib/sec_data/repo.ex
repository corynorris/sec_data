defmodule SecData.Repo do
  use Ecto.Repo,
    otp_app: :sec_data,
    adapter: Ecto.Adapters.Postgres
end
