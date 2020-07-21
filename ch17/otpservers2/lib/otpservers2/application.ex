defmodule Otpservers2.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    {:ok, _pid} = Sequence.Supervisor.start_link([5,"cat",9])
    
    #children = [
      # Starts a worker by calling: Otpservers2.Worker.start_link(arg)
      # {Otpservers2.Worker, arg}
    #]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    #opts = [strategy: :one_for_one, name: Otpservers2.Supervisor]
    #Supervisor.start_link(children, opts)
  end
end
