defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count(l) do
    count(l, 0)
  end

  defp count([], count), do: count
  defp count([hd | tail], count), do: count(tail, count + 1) 


  @spec reverse(list) :: list
  def reverse(l) do
    reverse(l, [])
  end

  defp reverse([], reversed), do: reversed
  defp reverse([hd | tail], reversed), do: reverse(tail, [hd | reversed])

  @spec map(list, (any -> any)) :: list
  def map(l, f) do
    map(l, f, []) 
  end

  defp map([], _, result), do: reverse(result)
  defp map([hd | tail], f, result), do: map(tail, f, [f.(hd) | result])

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do
    filter(l, f, [])
  end

  defp filter([], f, result), do: reverse(result)
  defp filter([hd | tail], f, result) do
    cond do
      !f.(hd) -> filter(tail, f, result)
      true -> filter(tail, f, [hd | result])
    end
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce(l, acc, f) do
    reducep(l, acc, f) 
  end

  defp reducep([], acc, _), do: acc
  defp reducep([hd | tail], acc, f), do: reducep(tail, f.(hd, acc), f)

  @spec append(list, list) :: list
  def append(a, b) do
    appendp(reverse(a),b)
  end

  defp appendp([hd | tail],l), do: appendp(tail, [hd | l])
  defp appendp(_, l), do: l

  @spec concat([[any]]) :: [any]
  def concat(ll) do
    reverse(reduce(ll, [], &(appendp(&1,&2))))
  end
end
