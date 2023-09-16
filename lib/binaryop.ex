defmodule BinaryOp do
  @spec do_add(any, any) :: binary | number
  def do_add(lhs, rhs) do
    if Validator.BinaryOp.can_operate(lhs, rhs) do
      lhs + rhs
    else
      to_string(lhs) <> to_string(rhs)
    end
  end

  @spec do_sub(number, number) :: number
  def do_sub(lhs, rhs) do
    if !Validator.BinaryOp.can_operate(lhs, rhs) do
      raise "Cannot subtract!"
    end

    lhs - rhs
  end

  @spec do_mul(number, number) :: number
  def do_mul(lhs, rhs) do
    if !Validator.BinaryOp.can_operate(lhs, rhs) do
      raise "Cannot multiply!"
    end

    lhs * rhs
  end

  @spec do_div(number, number) :: number
  def do_div(lhs, rhs) do
    (lhs / rhs) |> trunc
  end

  @spec do_rem(number, number) :: number
  def do_rem(lhs, rhs) do
    Kernel.rem(lhs, rhs)
  end

  def do_eq(lhs, rhs) do
    lhs == rhs
  end

  def do_neq(lhs, rhs) do
    lhs != rhs
  end

  def do_lt(lhs, rhs) do
    lhs < rhs
  end

  def do_gt(lhs, rhs) do
    lhs > rhs
  end

  def do_lte(lhs, rhs) do
    lhs <= rhs
  end

  def do_gte(lhs, rhs) do
    lhs >= rhs
  end

  def do_and(lhs, rhs) do
    lhs && rhs
  end

  def do_or(lhs, rhs) do
    lhs || rhs
  end
end
