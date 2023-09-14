defmodule Validator.Binary do
  def canDivide(rhs) do
    rhs > 0
  end

  def canAdd(lhs, rhs) do
    is_integer(lhs) and is_integer(rhs)
  end
end
