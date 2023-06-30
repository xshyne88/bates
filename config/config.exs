# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :bates,
  ecto_repos: [Bates.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :bates, BatesWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [
    formats: [json: BatesWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: Bates.PubSub,
  live_view: [signing_salt: "Mk0AxZKa"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :bates, Bates.Mailer, adapter: Swoosh.Adapters.Local

config :bates, BatesWeb.Endpoint, adapter: Bandit.PhoenixAdapter

config :ash, :use_all_identities_in_manage_relationship?, false

config :bates,
  ash_apis: [Bates.Auth]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
