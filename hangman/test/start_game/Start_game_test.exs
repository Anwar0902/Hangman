defmodule Hangman.Startgame.Start_game_Test do
  use ExUnit.Case
  alias Hangman.Startgame.Start_game
  doctest Hangman

  test "fetch_data" do
    {result, _} = Start_game.start_link()
    assert result == :ok
  end

  test "process state" do
    {result, pid} = Start_game.start_link()
    assert Process.alive?(pid)
  end

  test "play game" do
    # Start_game.start_link()
    # result = Start_game.play_game()
    # assert is_binary(result)
  end

  test "win or lose" do
    result = Start_game.win_or_lose(["a", "n"], 6, ["a", "b"])
    assert result == "YOU LOSE"
  end

  test "win OR lose" do
    result = Start_game.win_or_lose(["a", "n"], 6, ["a", "n"])
    refute result == "YOU WIN"
  end

  test "Startgame" do
    result = Start_game.startgame(["a", "b"], 6, ["a", "b"])
    assert result == "YOU WIN"
  end
end
