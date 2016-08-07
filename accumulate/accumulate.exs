defmodule Accumulate do
  @doc """
    Given a list and a function, apply the function to each list item and
    replace it with the function's return value.

    Returns a list.

    ## Examples

      iex> Accumulate.accumulate([], fn(x) -> x * 2 end)
      []

      iex> Accumulate.accumulate([1, 2, 3], fn(x) -> x * 2 end)
      [2, 4, 6]

  """

  @spec accumulate(list, (any -> any)) :: list
  def accumulate(list, fun) do
    list 
      |> _reverse([])
      |> _accumulate(fun, [])
  end

  defp _accumulate([], _, acc), do: acc
  defp _accumulate([hd | tl], fun, acc) do
    _accumulate(tl, fun, [fun.(hd) | acc])
  end

  defp _reverse([], acc), do: acc
  defp _reverse([hd | tl], acc), do: _reverse(tl, [hd | acc])
end
