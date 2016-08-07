defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    for candidate <- candidates,
      c = String.upcase(candidate),
      b = String.upcase(base),
      c != b,
      String.length(c) == String.length(base),
      String.graphemes(c) -- String.graphemes(b) == [],
    do: candidate
  end
end
