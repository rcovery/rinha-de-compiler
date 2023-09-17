defmodule Interpreter do
  def eval(expression) do
    kind = expression |> Map.get("kind") |> String.downcase() |> String.to_existing_atom()

    apply(Interpreter, kind, [expression])
    # IO.puts("None of them")
  end

  def int(expression) do
    expression["value"]
  end

  def str(expression) do
    expression["value"]
  end

  def bool(expression) do
    expression["value"]
  end

  def tuple(expression) do
    first_value = eval(expression["first"])
    second_value = eval(expression["second"])
    {first_value, second_value}
  end

  def first(expression) do
    eval(expression["value"]) |> elem(0)
  end

  def second(expression) do
    eval(expression["value"]) |> elem(1)
  end

  def print(expression) do
    value_to_print = eval(expression["value"])

    if is_tuple(value_to_print) do
      parsed_tuple = Tuple.to_list(value_to_print) |> Enum.join(", ")
      IO.puts("(#{parsed_tuple})")
    else
      IO.puts(value_to_print)
    end
  end

  def binary(expression) do
    lhs = eval(expression["lhs"])
    rhs = eval(expression["rhs"])

    try do
      def_name = ("do_" <> expression["op"]) |> String.downcase() |> String.to_existing_atom()

      apply(BinaryOp, def_name, [lhs, rhs])
    rescue
      e -> e
    end
  end
end
