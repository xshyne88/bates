defmodule Bates.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      BatesWeb.Telemetry,
      # Start the Ecto repository
      Bates.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Bates.PubSub},
      # Start Finch
      {Finch, name: Bates.Finch},
      # Start the Endpoint (http/https)
      BatesWeb.Endpoint
      # Start a worker by calling: Bates.Worker.start_link(arg)
      # {Bates.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Bates.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    BatesWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
