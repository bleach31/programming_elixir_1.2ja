defmodule Otpservers1.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Otpservers1.Worker.start_link(arg)
      # {Otpservers1.Worker, arg}
      {Stack.Server,[5,"cat",9]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Otpservers1.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
