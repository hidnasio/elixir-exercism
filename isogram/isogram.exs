defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t) :: boolean
  def isogram?(sentence) do
    clean_sentence = Regex.replace ~r/[\s,-]/, sentence, ""  

    clean_sentence 
    |> String.codepoints
    |> Enum.uniq
    |> Enum.count === clean_sentence |> String.length 
  end
end
