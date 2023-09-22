defmodule Rinha do
  def load(name) do
    rinha_file_name = name || "source"

    dirname = "/var/rinha/" <> rinha_file_name <> ".rinha.json"

    cond do
      File.exists?(dirname) ->
        read(dirname)

      File.exists?("." <> dirname) ->
        read("." <> dirname)
    end
  end

  def read(dir) do
    case File.read(dir) do
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
