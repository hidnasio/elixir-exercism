defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do

    increment = fn value ->
      cond do
        is_nil(value) -> 1
        true -> value + 1
      end
    end

    junk = ~r/[\s!@#$%^&:,_]/

    sentence
      |> String.downcase
      |> String.split(junk, trim: true) 
      |> Enum.reduce(%{}, &(update_in &2[&1], increment))
  end
end
