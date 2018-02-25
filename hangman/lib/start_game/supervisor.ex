defmodule Hangman.Startgame.Supervisor do
  use Supervisor
  alias Hangman.Startgame.Start_game

  def start_link do
    Supervisor.start_link(__MODULE__, [])
  end

  def init(_) do
    children = [
      worker(Start_game, [])
    ]

    supervise(children, strategy: :one_for_one)
  end
end
