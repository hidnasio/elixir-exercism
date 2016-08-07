defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a,a), do: :equal 
  def compare([], [_hd | _]), do: :sublist
  def compare([_hd | _], []), do: :superlist

  def compare(a, b) do
    _compare(a, b, a, b)
  end

  defp _compare([], [_hd_b | _tl_b], _, _), do: :sublist
  defp _compare([hd_a | []], [hd_b | []], _, _) when hd_a != hd_b, do: :unequal 
  defp _compare([hd_a | []], [hd_b | _tl_b], a, [_hd_b, tl_b]) when hd_a == hd_b, do: :sublist
  defp _compare([hd_a | []], [hd_b | _tl_b], a, [_hd_b, tl_b]) when hd_a != hd_b, do: _compare(a, tl_b, a, tl_b)
  defp _compare([hd_a | tl_a], [hd_b | tl_b], a, b), do: _compare(tl_a, tl_b, a, b)

end
