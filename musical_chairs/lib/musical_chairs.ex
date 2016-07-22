defmodule MusicalChairs do
  @input_file "input.txt"
  @output_file "output.txt"
  
  def main(_args) do
    play_musical_chairs
  end

  defp play_musical_chairs do
    File.rm(@output_file)

    @input_file
    |> File.stream!
    |> Stream.map(&process_round/1)
    |> Stream.with_index
    |> Enum.map(&write_round/1)
  end

  defp process_round(line) do
    line
    |> children_and_chairs
    |> eliminated_children
  end

  defp children_and_chairs(line) do
    line
    |> String.split
    |> Enum.map(&String.to_integer/1)
    |> List.to_tuple
  end

  defp eliminated_children({children, chairs}) do
    if chairs > children do
      0
    else
      children - chairs
    end
  end

  defp write_round({children_eliminated, index}) do
    round = index + 1
    round_report = "Round ##{round}: #{children_eliminated} children eliminated\n"

    @output_file
    |> File.write!(round_report, [:append])
  end
end
