defmodule Rinha do
  def load(name) do
    rinha_file_name = name

    case File.read("./sources/" <> rinha_file_name <> ".rinha.json") do
      {:ok, data} ->
        {:ok, json} = JSON.decode(data)
        Interpreter.eval(json["expression"], %{})

      {:error, reason} ->
        raise("Cannot load file!: " <> to_string(reason))
    end
  end
end

[file] = System.argv()
Rinha.load(file)
