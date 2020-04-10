defmodule SecDataWeb.Router do
  use SecDataWeb, :router

  pipeline :api do
    plug CORSPlug, origin: ["http://localhost:3000", "https://secdata.corynorris.me"]
    plug :accepts, ["json"]
  end

  scope "/api", SecDataWeb do
    pipe_through :api

    get "/search", CompanyController, :search
    get "/datasets", DatasetController, :index

    resources "/companies", CompanyController, only: [:index, :show] do
      resources "/submissions", SubmissionController, only: [:index] do
        get "/presentations", StatementController, :presentations
        get "/numerics", StatementController, :numerics
      end
    end
  end
end
