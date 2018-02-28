defmodule Hangman.Startgame.Supervisor_test do
  use ExUnit.Case
  alias Hangman.Startgame.Supervisor
  doctest Hangman

  test "start_link" do
    {result, _} = Supervisor.start_link()
    assert result == :ok
  end

  test "process state" do
    {result, pid} = Supervisor.start_link()
    assert Process.alive?(pid)
  end
end
