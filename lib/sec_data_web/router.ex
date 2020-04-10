defmodule SecDataWeb.Router do
  use SecDataWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", SecDataWeb do
    pipe_through :api

    get "/search", CompanyController, :search

    resources "/companies", CompanyController, only: [:index, :show] do
      get "/submissions", SubmissionController, :index do
        get "/presentations", StatementController, :presentations
        get "/numerics", StatementController, :numerics
      end
    end
  end
end
