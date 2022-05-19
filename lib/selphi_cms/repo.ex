defmodule SelphiCms.Repo do
  use Ecto.Repo,
    otp_app: :selphi_cms,
    adapter: Ecto.Adapters.Postgres
end
