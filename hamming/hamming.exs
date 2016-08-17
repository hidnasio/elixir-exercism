defmodule DNA do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> DNA.hamming_distance('AAGTCATA', 'TAGCGATC')
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: non_neg_integer
  def hamming_distance(strand1, strand2) do
    do_hamming_distance(strand1, strand2, 0)
  end

  defp do_hamming_distance([],[], acc) do
    {:ok, acc}
  end
  defp do_hamming_distance([hd1 | tl1], [hd2 | tl2], acc) when hd1 != hd2 do
    do_hamming_distance(tl1, tl2, acc + 1)
  end
  defp do_hamming_distance([_ | tl1], [_ | tl2], acc) do
    do_hamming_distance(tl1, tl2, acc)
  end
  defp do_hamming_distance(_, _, _) do
    {:error, "Lists must be the same length."}
  end
end
