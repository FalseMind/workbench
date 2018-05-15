# Phoenix applications start the HelloWeb.Endpoint as a supervised process.
# By default, the Endpoint is added to the supervision tree in
# lib/hello/application.ex as a supervised process. Each request begins and ends
# its lifecycle inside your application in an endpoint. The endpoint handles
# starting the web server and transforming requests through several defined plugs
# before calling the Router.
# Endpoints gather together common functionality and serve as entrance and exit
# for all of the HTTP requests to your application. The endpoint holds plugs
# that are common to all requests coming into your application

defmodule Hello.Application do
  use Application

  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec

    # Define workers and child supervisors to be supervised
    children = [
      # Start the Ecto repository
      supervisor(Hello.Repo, []),
      # Start the endpoint when the application starts
      supervisor(HelloWeb.Endpoint, []),
      # Start your own worker by calling: Hello.Worker.start_link(arg1, arg2, arg3)
      # worker(Hello.Worker, [arg1, arg2, arg3]),
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Hello.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    HelloWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
