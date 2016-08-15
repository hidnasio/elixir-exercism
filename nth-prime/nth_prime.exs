defmodule Prime do

  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(0), do: raise ArgumentError 
  def nth(count) do
    generate_prime(2, count, []) |> hd
  end

  defp generate_prime(2, count, _), do: generate_prime(3, count - 1, [2])
  defp generate_prime(candidate, count, primes) do
    cond do
      count == 0 
        -> primes
      Enum.all?(primes, &rem(candidate, &1) != 0)
        -> generate_prime(candidate + 2, count - 1, [candidate | primes])
      true 
        -> generate_prime(candidate + 2, count, primes)
    end
  end
end
