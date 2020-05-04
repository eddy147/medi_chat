# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :medi_chat,
  ecto_repos: [MediChat.Repo]

# Configures the endpoint
config :medi_chat, MediChatWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "eGQ4xBxXBdza+kbnLC6wxdQ+LQhwKAbq1ilKQtp/VsycljniBUAMzM6AvlX462Zw",
  render_errors: [view: MediChatWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: MediChat.PubSub,
  live_view: [signing_salt: "GddkSB5i"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
