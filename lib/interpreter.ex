defmodule Interpreter do
  def eval(expression) do
    kind = expression |> Map.get("kind")

    case kind do
      "Int" ->
        expression["value"]

      "Str" ->
        expression["value"]

      "Bool" ->
        expression["value"]

      "Tuple" ->
        {expression["first"], expression["second"]}

      "First" ->
        eval(expression["value"]) |> elem(0)

      "Second" ->
        eval(expression["value"]) |> elem(1)

      "Print" ->
        IO.puts(eval(expression["value"]))

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
