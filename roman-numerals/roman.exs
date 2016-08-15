defmodule Roman do
  @symbols [
    {1000, "M"},
    {900, "CM"},
    {500, "D"},
    {400, "CD"},
    {100, "C"},
    {90, "XC"},
    {50, "L"},
    {40, "XL"},
    {10, "X"},
    {9, "IX"},
    {5, "V"},
    {4, "IV"},
    {1, "I"}
  ]

  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t
  def numerals(number) do
    do_numerals(number, @symbols, "")
  end

  defp do_numerals(number, [], acc), do: acc
  defp do_numerals(number, symbols, acc) do
    [head | tail] = symbols
    {val, symbol} = head
    cond do
      number - val > 0
        -> do_numerals(number - val, symbols, acc <> symbol)
      number - val == 0
        -> do_numerals(number - val, tail, acc <> symbol)
      number - val < 0
        -> do_numerals(number, tail, acc)
      true
        -> acc
    end 
  end
end
