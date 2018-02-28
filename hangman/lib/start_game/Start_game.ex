defmodule Hangman.Startgame.Start_game do
  use GenServer
  alias Hangman.Startgame.Readfile
  import Game

  @moduledoc """
  Documentation for HANGMAN.
  """

  @doc """
  This is a game of Hangman.
  There is a word in background of specific length.
  you have to guess the word and enter a specific charecter.
  If you enter any wrong charecter then you have to pay for it.
  So, make a better move and save your life.
  """
  def start_link do
    GenServer.start_link(__MODULE__, [], name: :hangman_game)
  end

  def init(_) do
    guess_word = Readfile.fetch_data()
    # s guess_word = ["a", "n", "w", "a", "r"]
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

  def read_input() do
    data = IO.gets("Try Your Luck :- ")
    data = String.trim(data)
  end

  def win_or_loose(_word, 6, _required_word), do: "YOU LOOSE"
  def win_or_loose(word, count, required_word), do: startgame(word, count, required_word)

  def startgame(word, count, required_word) do
    IO.puts("*****************************************************")
    IO.inspect(required_word)

    data = read_input()

    {unfilled_positions, count, required_word} = Game.check(data, word, count, required_word)

    if unfilled_positions == 0 do
      "YOU WIN"
    else
      win_or_loose(word, count, required_word)
    end
  end
end
