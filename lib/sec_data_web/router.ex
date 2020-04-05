defmodule SecDataWeb.Router do
  use SecDataWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", SecDataWeb do
    pipe_through :api
  end
end
