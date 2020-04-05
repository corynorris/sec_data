# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :sec_data,
  ecto_repos: [SecData.Repo]

# Configures the endpoint
config :sec_data, SecDataWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "h80i3hnhQLzEE7NudjVpuoeklzlq4gDSdpqbnQVrsukfLV0kHM0KMG/0L8GQZD3c",
  render_errors: [view: SecDataWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: SecData.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "qVZix5CY"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
