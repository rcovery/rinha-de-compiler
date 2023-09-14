defmodule Binary do
  # Concatenate strings
  def add(lhs, rhs) do
    if Validator.Binary.can_add(lhs, rhs) do
      lhs + rhs
    else
      to_string(lhs) <> to_string(rhs)
    end
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
    if Validator.Binary.can_divide(rhs) == true do
      lhs / rhs
    else
      raise("Cannot divide by 0!")
    end
  end
end
