defmodule ArtistQuery do

  def main(args) do
    query_loop(args)
  end

  defp query_loop(music_file) do
    artist = String.upcase(prompt)
    load_songs(music_file)
    |> Enum.filter_map(&(String.upcase(&1["Artist"])) == artist, &(&1["Name"]))
    |> print_results(titlecase(artist))

    query_loop(music_file)
  end

  defp print_results(songs, artist) do
    print_banner(artist)
    print_songs(songs)
    IO.puts ""
  end

  defp print_banner(artist) do
    message = "* Songs by #{artist} *"
    separator = String.duplicate("*", String.length(message))

    IO.puts(separator <> "\n" <> message <> "\n" <> separator)
  end

  defp print_songs(songs) do
    case songs do
      [] -> IO.puts "< No songs found >"
      _ -> Enum.map(songs, &IO.puts(&1))
    end
  end

  defp prompt do
    IO.gets("Query: ")
    |> String.strip
  end

  defp titlecase(string) do
    string
    |> String.split
    |> Enum.map(&String.capitalize(&1))
    |> Enum.join(" ")
  end

  defp load_songs(file) do
    File.stream!(file)
    |> CSV.decode(headers: true)
  end
end
