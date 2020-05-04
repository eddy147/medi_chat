defmodule MediChat.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      MediChat.Repo,
      # Start the Telemetry supervisor
      MediChatWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: MediChat.PubSub},
      # Start the Endpoint (http/https)
      MediChatWeb.Endpoint
      # Start a worker by calling: MediChat.Worker.start_link(arg)
      # {MediChat.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MediChat.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    MediChatWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
