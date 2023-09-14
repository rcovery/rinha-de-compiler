defmodule Binary do
  def add(lhs, rhs) do
    lhs + rhs
  end

  @spec sub(number, number) :: number
  def sub(lhs, rhs) do
    lhs - rhs
  end

  @spec mul(number, number) :: number
  def mul(lhs, rhs) do
    lhs * rhs
  end

  @spec div(number, number) :: float
  def div(lhs, rhs) do
    if Validator.Binary.canDivide(rhs) == true do
      lhs / rhs
    else
      raise("Cannot divide by 0!")
    end
  end
end
