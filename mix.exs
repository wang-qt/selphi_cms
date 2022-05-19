defmodule SelphiCms.MixProject do
  use Mix.Project

  def project do
    [
      app: :selphi_cms,
      version: "0.1.0",
      elixir: "~> 1.12",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix] ++ [:gettext] ++ Mix.compilers() ++ [:surface],
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {SelphiCms.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(:dev), do: ["lib"] ++ catalogues()
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:bcrypt_elixir, "~> 3.0"},
      {:phoenix, "~> 1.6.8"},
      {:phoenix_ecto, "~> 4.4"},
      {:ecto_sql, "~> 3.6"},
      {:postgrex, ">= 0.0.0"},
      {:phoenix_html, "~> 3.0"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:phoenix_live_view, "~> 0.17.5"},
      {:floki, ">= 0.30.0", only: :test},
      {:phoenix_live_dashboard, "~> 0.6"},
      {:esbuild, "~> 0.4", runtime: Mix.env() == :dev},
      {:swoosh, "~> 1.3"},
      {:telemetry_metrics, "~> 0.6"},
      {:telemetry_poller, "~> 1.0"},
      {:gettext, "~> 0.18"},
      {:jason, "~> 1.2"},
      {:plug_cowboy, "~> 2.5"},
      {:selphi_daisy, git: "https://gitee.com/wangqingtai/selphi_daisy.git"},
      {:selphi_dynatable, git: "https://gitee.com/wangqingtai/selphi_dynatable.git"},
      {:surface, "~> 0.7.4"},
      {:surface_catalogue, "~> 0.4.1"},
      {:surface_markdown, "~> 0.4.0"},
      {:tzdata, "~> 1.1.1"},     # 在 congfig.exs 添加 config :elixir, :time_zone_database, Tzdata.TimeZoneDatabase
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to install project dependencies and perform other setup tasks, run:
  #
  #     $ mix setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      setup: ["deps.get", "ecto.setup"],
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.create --quiet", "ecto.migrate --quiet", "test"],
#      "assets.deploy": ["esbuild default --minify", "phx.digest"],
      # 发布 catalogue 资源
#      "assets.catalogue": ["esbuild catalogue --minify", "phx.digest"],
      "assets.catalogue": ["esbuild catalogue --minify"],
      # 发布  selphi_daisy 的 scss 文件
      "assets.selphi.daisy": ["run  priv/scripts/publish_daisy_assets.exs"],
    ]
  end
  def catalogues do
    [
      "priv/catalogue",
      "deps/selphi_daisy/priv/catalogue",
    ]
  end

end
