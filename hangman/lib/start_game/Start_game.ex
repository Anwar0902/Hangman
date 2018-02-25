defmodule Hangman.Startgame.Start_game do
  use GenServer
  alias Hangman.Startgame.Readfile
  import Game

  @moduledoc """
  Documentation for HANGMAN.
  """

  @doc """
  Hello world.

  ## Examples

      iex> HANGMAN.hello
      :world

  """
  def start_link do
    GenServer.start_link(__MODULE__, [], name: :hangman_game)
  end

  def init(_) do
    guess_word = Readfile.fetch_data()
    # guess_word = ["a", "n", "w", "a", "r"]
    {:ok, guess_word}
  end

  def play_game() do
    GenServer.call(:hangman_game, {:play_game}, 20000)
  end

  # callback

  def handle_call({:play_game}, _from, guess_word) do
    required_word =
      1..length(guess_word)
      |> Enum.map(fn key -> "-" end)

    result = startgame(guess_word, 0, required_word)
    {:reply, result, guess_word}
  end

  def win_or_lose(word, 6, required_word), do: IO.inspect("YOU LOSE")
  def win_or_lose(word, count, required_word), do: startgame(word, count, required_word)

  def startgame(word, count, required_word) do
    IO.puts("*****************************************************")
    IO.inspect(required_word)
    data = IO.gets("Try Your Luck :- ")
    data = String.trim(data)
    {unfilled_positions, count, required_word} = Game.check(data, word, count, required_word)

    if unfilled_positions == 0 do
      IO.inspect("YOU WIN")
    else
      win_or_lose(word, count, required_word)
    end
  end
end
