defmodule BracketPush do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """

  @brackets %{
    "{" => {:open, "}"}, 
    "[" => {:open, "]"}, 
    "(" => {:open, ")"}, 
    "}" => {:close, "{"}, 
    "]" => {:close, "["}, 
    ")" => {:close, "("}
  }

  @spec check_brackets(String.t) :: boolean
  def check_brackets(str) do
    str
    |> String.graphemes
    |> Enum.reduce_while([],&do_magic(&1, &2))
    |> Enum.empty?
  end

  defp do_magic(e, acc) do

    case @brackets do
      %{^e => {:open, _}} -> {:cont, [e | acc]}
      %{^e => {:close, _}} when acc == [] -> {:halt, [e]}
      %{^e => {:close, open}} when open != hd(acc) -> {:halt, [e | acc]}
      %{^e => {:close, _}} -> {:cont, tl(acc)}
      _ -> {:cont, acc}
    end
  end
end
