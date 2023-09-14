defmodule Rinha do
  def load(rinha_file_name) do
    case File.read("./sources/" <> rinha_file_name <> ".rinha.json") do
      {:ok, data} ->
        parsed_json = JSON.decode(data)
        IO.puts(parsed_json)

      {:error, reason} ->
        :error
    end
  end
end

Rinha.load("app")
