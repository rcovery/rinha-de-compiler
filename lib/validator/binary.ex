defmodule Validator.Binary do
  def can_divide(rhs) do
    rhs > 0
  end

  def can_add(lhs, rhs) do
    is_integer(lhs) and is_integer(rhs)
  end
end
