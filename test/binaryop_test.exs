defmodule BinaryTest do
  use ExUnit.Case
  doctest BinaryOp

  test "addition of two numbers" do
    assert BinaryOp.do_add(6, 6) == 12
  end

  test "must concatenate when arg is not integer" do
    assert BinaryOp.do_add("a", 2) == "a2"
    assert BinaryOp.do_add(2, "a") == "2a"
    assert BinaryOp.do_add("z", "a") == "za"
    assert BinaryOp.do_add(true, "6") == "true6"
  end

  test "subtract two numbers" do
    assert BinaryOp.do_sub(6, 6) == 0
    assert BinaryOp.do_sub(0, -1) == 1
  end

  test "multiply two numbers" do
    assert BinaryOp.do_mul(6, 6) == 36
  end

  test "divide two numbers" do
    assert BinaryOp.do_div(6, 6) == 1
    assert BinaryOp.do_div(3, 2) == 1
  end

  test "divide two numbers and get remainder" do
    assert BinaryOp.do_rem(4, 2) == 0
    assert BinaryOp.do_rem(3, 2) == 1
  end

  test "equal" do
    assert BinaryOp.do_eq("a", "a") == true
    assert BinaryOp.do_eq(2, BinaryOp.do_add(1, 1)) == true
    assert BinaryOp.do_eq(true, true) == true
    assert BinaryOp.do_eq(true, :avoid_people) == false
  end

  test "not equal" do
    assert BinaryOp.do_neq("a", "b") == true
    assert BinaryOp.do_neq(3, BinaryOp.do_add(1, 1)) == true
    assert BinaryOp.do_neq(true, false) == true
    assert BinaryOp.do_neq(:avoid_people, :avoid_people) == false
  end

  test "lesser than" do
    assert BinaryOp.do_lt(1, 2) == true
    assert BinaryOp.do_lt(99, 2) == false
  end

  test "greater than" do
    assert BinaryOp.do_gt(1, 2) == false
    assert BinaryOp.do_gt(99, 2) == true
  end

  test "lesser or equal than" do
    assert BinaryOp.do_lte(1, 2) == true
    assert BinaryOp.do_lte(2, 2) == true
  end

  test "greater or equal than" do
    assert BinaryOp.do_gte(2, 2) == true
    assert BinaryOp.do_gte(99, 2) == true
  end

  test "and operator" do
    assert BinaryOp.do_and(true, false) == false
    assert BinaryOp.do_and(true, true) == true
  end

  test "or operator" do
    assert BinaryOp.do_or(true, false) == true
    assert BinaryOp.do_or(false, false) == false
  end
end
