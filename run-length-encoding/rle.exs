defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec encode(String.t) :: String.t
  def encode(string) do
    string
      |> String.graphemes
      |> Enum.reduce([], &group_letters/2)
      |> Enum.flat_map(&count_letters/1)
      |> Enum.join
  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    Regex.scan(~r/\d+\w/, string)
      |> Enum.concat
      |> Enum.reduce("", fn (x, acc) -> acc <> duplicate_letter(x) end)
  end

  defp group_letters(x, []) do
    [[x]]
  end

  defp group_letters(x, acc) do
    case List.last(List.flatten(acc)) do
      ^x -> List.replace_at(acc, -1, List.last(acc) ++ [x])
      _ -> acc ++ [[x]]
    end
  end

  defp count_letters(x) do
    [to_string(Enum.count(x)) <> List.first(x)]
  end

  defp duplicate_letter(x) do
    String.duplicate(get_letter(x), get_number(x))
  end

  defp get_letter(x) do
    String.slice(x, -1, 1)
  end

  defp get_number(x) do
    String.to_integer(String.slice(x, 0, String.length(x) - 1))
  end
end
