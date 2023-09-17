defmodule Interpreter do
  def(eval(expression)) do
    kind = expression |> Map.get("kind")

    case kind do
      "Int" ->
        expression["value"]

      "Str" ->
        expression["value"]

      "Bool" ->
        expression["value"]

      "Tuple" ->
        first_value = eval(expression["first"])
        second_value = eval(expression["second"])
        {first_value, second_value}

      "First" ->
        eval(expression["value"]) |> elem(0)

      "Second" ->
        eval(expression["value"]) |> elem(1)

      "Print" ->
        value_to_print = eval(expression["value"])

        if is_tuple(value_to_print) do
          parsed_tuple = Tuple.to_list(value_to_print) |> Enum.join(", ")
          IO.puts("(#{parsed_tuple})")
        else
          IO.puts(value_to_print)
        end

      "Binary" ->
        lhs = eval(expression["lhs"])
        rhs = eval(expression["rhs"])

        try do
          def_name = ("do_" <> expression["op"]) |> String.downcase() |> String.to_existing_atom()

          apply(BinaryOp, def_name, [lhs, rhs])
        rescue
          # TODO Error handling
          e -> e
        end

      _ ->
        IO.puts("None of them")
    end
  end
end
