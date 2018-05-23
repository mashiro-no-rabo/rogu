use Mix.Config

config :rogu,
  ecto_repos: [Rogu.Repo]

config :rogu, RoguWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "super-secret",
  render_errors: [view: RoguWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Rogu.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

import_config "#{Mix.env}.exs"
