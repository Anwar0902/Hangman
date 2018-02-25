defmodule Hangman.Startgame.Readfile do
  @path_of_file "C:/Exercism/elixir/hangman/data/words.txt"
  def fetch_data do
    word =
      File.stream!(@path_of_file)
      |> Stream.map(&String.trim_trailing/1)
      |> Enum.into([])

    word = Enum.at(word, :rand.uniform(173_528))

    word =
      word
      |> String.graphemes()
      |> to_charlist

    word
  end
end
