defmodule Interpreter do
  def eval(expression) do
    kind = expression |> Map.get("kind")

    case kind do
      "Int" ->
        expression["value"]

      "Print" ->
        IO.puts(eval(expression["value"]))

      "Binary" ->
        lhs = eval(expression["lhs"])
        rhs = eval(expression["rhs"])
        true

        case expression["op"] do
          "Add" -> Binary.add(lhs, rhs)
          _ -> raise "Nothing to do!"
        end

      _ ->
        IO.puts("None of them")
    end
  end
end
