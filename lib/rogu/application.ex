defmodule Rogu.Application do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      supervisor(Rogu.Repo, []),
      supervisor(RoguWeb.Endpoint, []),
    ]

    opts = [strategy: :one_for_one, name: Rogu.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    RoguWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
