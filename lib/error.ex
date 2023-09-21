defmodule Error do
  def handle(location, message \\ "Ocorreu um problema no seu código:") do
    context = 20
    loc_filename = location["filename"]

    {:ok, file_content} = File.read(loc_filename)
    char_count = String.length(file_content)

    loc_start = if(location["start"] < context, do: 0, else: location["start"] - context)

    loc_end =
      if(location["end"] > char_count - context,
        do: char_count,
        else: location["end"] + context
      )

    IO.puts(message)
    IO.puts(String.slice(file_content, loc_start, loc_end))
  end
end
