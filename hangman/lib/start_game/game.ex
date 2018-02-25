defmodule Game do
  @list_of_emoji %{
    0 => "          O",
    1 => "          O\n         )",
    2 => "          O\n         )|",
    3 => "          O\n         )|(",
    4 => "          O\n         )|(         \n          |\n         )",
    5 => "          O\n         )|(         \n          |\n         )|("
  }

  def match_function(data, [], required_word), do: []

  def match_function(data, word, required_word) do
    if hd(word) == data do
      [data | match_function(data, tl(word), tl(required_word))]
    else
      [
        hd(required_word)
        | match_function(data, tl(word), tl(required_word))
      ]
    end
  end

  def check(data, word, count, required_word) do
    unfilled_positions_before =
      required_word
      |> Enum.filter(&(&1 == "-"))
      |> Enum.count()

    # IO.puts("No. of unfilled_positions :- #{unfilled_positions_before}")
    required_word = match_function(data, word, required_word)

    # IO.inspect(required_word)

    unfilled_positions_after =
      required_word
      |> Enum.filter(&(&1 == "-"))
      |> Enum.count()

    if unfilled_positions_before == unfilled_positions_after do
      IO.puts(@list_of_emoji[count])
      IO.puts("*****************************************************")
      {unfilled_positions_after, count + 1, required_word}
    else
      {unfilled_positions_after, count, required_word}
    end
  end
end
