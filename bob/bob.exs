defmodule Bob do
  def hey(input) do
    cond do
      String.trim(input) == "" -> "Fine. Be that way!"
      String.ends_with?(input, "?") -> "Sure."
      input == String.upcase(input) and input != String.downcase(input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end
end
