defmodule HelloPopcorn.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: HelloPopcorn.Worker.start_link(arg)
      # {HelloPopcorn.Worker, arg},
    ]

    # If no supervision tree is needed, uncomment the line below to the end.
    # The line below starts a supervision tree:
    opts = [strategy: :one_for_one, name: HelloPopcorn.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
