defmodule Validator.BinaryOp do
  def can_operate(lhs, rhs) do
    is_integer(lhs) and is_integer(rhs)
  end
end
