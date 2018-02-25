defmodule Hangman do
  use Application

  def start(_type, _arge) do
    Hangman.Supervisor.start_link()
  end
end
