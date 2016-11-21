# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

# config :cargo, Cargo.Repo.Activities,
#   adapter: Ecto.Adapters.Postgres,
#   database: "cargo_repo",
#   hostname: "localhost"
#
# config :cargo, Cargo.Repo.Loyalties,
#   adapter: Ecto.Adapters.Postgres,
#   database: "cargo_repo",
#   hostname: "localhost"
#
# config :cargo, Cargo.Repo.Vehicles,
#   adapter: Ecto.Adapters.Postgres,
#   database: "cargo_repo",
#   hostname: "localhost"
#
# config :cargo, Cargo.Repo.Partners,
#   adapter: Ecto.Adapters.Postgres,
#   database: "cargo_repo",
#   hostname: "localhost"

config :cargo, Cargo.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "cargo_repo",
  hostname: "cargoonwheels.cx3qkv9omyrn.us-west-2.rds.amazonaws.com",
  username: "cargouser",
  password: "sekhar_007"

config :cargo, ecto_repos: [Cargo.Repo]

config :maru, Cargo.API,
  http: [port: 8880]


# This configuration is loaded before any dependency and is restricted
# to this project. If another project depends on this project, this
# file won't be loaded nor affect the parent project. For this reason,
# if you want to provide default values for your application for
# 3rd-party users, it should be done in your "mix.exs" file.

# You can configure for your application as:
#
#     config :cargo, key: :value
#
# And access this configuration in your application as:
#
#     Application.get_env(:cargo, :key)
#
# Or configure a 3rd-party app:
#
#     config :logger, level: :info
#

# It is also possible to import configuration files, relative to this
# directory. For example, you can emulate configuration per environment
# by uncommenting the line below and defining dev.exs, test.exs and such.
# Configuration from the imported file will override the ones defined
# here (which is why it is important to import them last).
#
#     import_config "#{Mix.env}.exs"
