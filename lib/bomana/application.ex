defmodule Bomana.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Bomana.Repo,
      # Start the Telemetry supervisor
      BomanaWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Bomana.PubSub},
      # Start the Endpoint (http/https)
      BomanaWeb.Endpoint
      # Start a worker by calling: Bomana.Worker.start_link(arg)
      # {Bomana.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Bomana.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    BomanaWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
