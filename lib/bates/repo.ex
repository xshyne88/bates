defmodule Bates.Repo do
  use Ecto.Repo,
    otp_app: :bates,
    adapter: Ecto.Adapters.Postgres
end
