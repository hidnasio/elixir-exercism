defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    for n <- 0..limit - 1,
      factor <- factors,
      rem(n, factor) == 0 do 
        n 
      end 
      
      |> Enum.dedup
      |> Enum.sum
  end
end
