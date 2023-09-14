defmodule BinaryTest do
  use ExUnit.Case
  doctest Binary

  test "addition of two numbers" do
    assert Binary.add(6, 6) == 12
  end

  test "must concatenate when arg is not integer" do
    assert Binary.add(6, "6") == "66"
    assert Binary.add(true, "6") == "true6"
  end

  test "subtraction of two numbers" do
    assert Binary.sub(6, 6) == 0
  end

  test "division of two numbers" do
    assert Binary.div(6, 6) == 1
    assert Binary.div(0, 2) == 0
  end

  test "divide by 0 must throw an exception" do
    assert_raise RuntimeError, "Cannot divide by 0!", fn -> Binary.div(6, 0) end
  end

  test "multiplication of two numbers" do
    assert Binary.mul(6, 6) == 36
  end
end
