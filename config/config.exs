# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :selphi_cms,
  ecto_repos: [SelphiCms.Repo]

# Configures the endpoint
config :selphi_cms, SelphiCmsWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: SelphiCmsWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: SelphiCms.PubSub,
  live_view: [signing_salt: "jp3cqrfL"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :selphi_cms, SelphiCms.Mailer, adapter: Swoosh.Adapters.Local

# Swoosh API client is needed for adapters other than SMTP.
config :swoosh, :api_client, false

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.14.29",
#  default: [
#    args:
#      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
#    cd: Path.expand("../assets", __DIR__),
#    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
#  ],
  catalogue: [
    args: ~w(js/app.js --bundle --target=es2016 --minify --outdir=../../../priv/static/assets/catalogue),
    cd: Path.expand("../deps/surface_catalogue/assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# 配置gettext, 默认为中文
config :gettext, :default_locale, "zh"

# 安装除了utc以外的时区, for SelphiDaisy.Form.DateTimeLocalInput  组件
config :elixir, :time_zone_database, Tzdata.TimeZoneDatabase



# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
