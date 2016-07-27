defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    import String, only: :functions 
    import Enum, only: [flat_map: 2, filter: 2, join: 1] 
    import Kernel, except: [length: 1]

    capitalizeFirstLetter = fn str -> 
      capitalize(at(str, 0)) <> slice(str, 1, length(str) - 1)
    end

    junk = ~r/[\s,-]/

    string
      |> split(junk, trim: true)
      |> flat_map(&(graphemes(capitalizeFirstLetter.(&1))))
      |> filter(&(upcase(&1) == &1))
      |> join
  end
end
