# double_number = &(&1 * 2)
# 4 |> double_number.() |> IO.puts()

defmodule BinaryOperators do
  def add lhs, rhs do
    lhs + rhs
  end

  def sub lhs, rhs do
    lhs - rhs
  end
end

BinaryOperators.add(4,6) |> BinaryOperators.sub(2) |> IO.puts()
