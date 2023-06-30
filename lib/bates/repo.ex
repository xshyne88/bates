defmodule Bates.Repo do
  use AshPostgres.Repo, otp_app: :bates
  # use Ecto.Repo,
  #   otp_app: :bates,
  #   adapter: Ecto.Adapters.Postgres
  def installed_extensions do
    ["uuid-ossp", "citext"]
  end
end
