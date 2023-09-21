defmodule Interpreter do
  def eval(expression, scope) do
    kind = expression |> Map.get("kind") |> String.downcase()
    parsed_kind = "do_#{kind}" |> String.to_atom()

    apply(Interpreter, parsed_kind, [expression, scope])
  end

  def do_int(expression, _) do
    expression["value"]
  end

  def do_str(expression, _) do
    expression["value"]
  end

  def do_bool(expression, _) do
    expression["value"]
  end

  def do_tuple(expression, scope) do
    first_value = eval(expression["first"], scope)
    second_value = eval(expression["second"], scope)
    {first_value, second_value}
  end

  def do_if(expression, scope) do
    evaluated_condition = eval(expression["condition"], scope)

    if evaluated_condition do
      eval(expression["then"], scope)
    else
      eval(expression["otherwise"], scope)
    end
  end

  def do_first(expression, scope) do
    eval(expression["value"], scope) |> elem(0)
  end

  def do_second(expression, scope) do
    eval(expression["value"], scope) |> elem(1)
  end

  def do_parameter(expression, _) do
    expression["text"]
  end

  def do_let(expression, scope) do
    variable_name = do_parameter(expression["name"], scope)
    variable_value = eval(expression["value"], scope)

    scope = Map.put(scope, variable_name, variable_value)

    eval(expression["next"], scope)
  end

  def do_var(expression, scope) do
    Map.get(scope, expression["text"])
  end

  def do_function(expression, _) do
    expression
  end

  def do_call(expression, scope) do
    callee = eval(expression["callee"], scope)
    parameters = callee["parameters"]
    arguments = expression["arguments"]

    if length(parameters) != length(arguments) do
      Error.handle(expression["location"], "A quantidade de argumentos é inválida!")
      raise("")
    end

    modified_scope =
      arguments
      |> Enum.with_index()
      |> Enum.reduce(%{}, fn {arg, idx}, accumulator ->
        param = parameters |> Enum.at(idx) |> Map.get("text")

        accumulator |> Map.put(param, eval(arg, scope))
      end)

    merged_scopes = scope |> Map.merge(modified_scope)
    callee_function = eval(callee["value"], merged_scopes)

    callee_function
  end

  def do_print(expression, scope) do
    value_to_print = eval(expression["value"], scope)

    cond do
      is_tuple(value_to_print) ->
        parsed_tuple = Tuple.to_list(value_to_print) |> Enum.join(", ")
        IO.puts("(#{parsed_tuple})")

      is_map(value_to_print) && Map.get(value_to_print, "kind") == "Function" ->
        IO.puts("<#closure>")

      true ->
        IO.puts(value_to_print)
    end
  end

  def do_binary(expression, scope) do
    lhs = eval(expression["lhs"], scope)
    rhs = eval(expression["rhs"], scope)

    try do
      def_name =
        ("do_" <> expression["op"])
        |> String.downcase()
        |> String.to_atom()

      apply(BinaryOp, def_name, [lhs, rhs])
    rescue
      _ ->
        Error.handle(expression["location"], "Operação não tratada!")
        raise("")
    end
  end
end
