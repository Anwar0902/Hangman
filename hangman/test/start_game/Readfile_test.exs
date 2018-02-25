defmodule Hangman.Startgame.Readfile_Test do
  use ExUnit.Case
  alias Hangman.Startgame.Readfile
  doctest Hangman

  test "fetch_data" do
    list_of_characters = Readfile.fetch_data()
    assert is_list(list_of_characters)
  end
end
