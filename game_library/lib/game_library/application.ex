defmodule GameLibrary.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      GameLibraryWeb.Telemetry,
      # Start the Ecto repository
      GameLibrary.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: GameLibrary.PubSub},
      # Start Finch
      {Finch, name: GameLibrary.Finch},
      # Start the Endpoint (http/https)
      GameLibraryWeb.Endpoint
      # Start a worker by calling: GameLibrary.Worker.start_link(arg)
      # {GameLibrary.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: GameLibrary.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    GameLibraryWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
