defmodule Bomana.Repo do
  use Ecto.Repo,
    otp_app: :bomana,
    adapter: Ecto.Adapters.Postgres
end
