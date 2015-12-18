defmodule AdventOfCode.DayTwo do
  def run do
    input = File.read!("inputs/day_two.txt")
    total_footage = input |> calc_total_footage()
    total_ribbon_length = input |> calc_total_ribbon_length()

    IO.puts "Total wrapping paper footage: #{total_footage}"
    IO.puts "Total ribbon length: #{total_ribbon_length}"
  end

  def calc_total_footage(input) do
    input
    |> prepare_input()
    |> Enum.reduce(0, fn(measurements, acc)->
         current_box = calc_individual_wrapping_paper(measurements)

         current_box + acc
       end)
  end

  def calc_total_ribbon_length(input) do
    input
    |> prepare_input()
    |> Enum.reduce(0, fn(measurements, acc)->
         current_box = calc_individual_ribbon_length(measurements)

         current_box + acc
       end)
  end

  def calc_individual_wrapping_paper([l, w, h]) do
    side_1 = l * w
    side_2 = w * h
    side_3 = h * l
    extra = Enum.min([side_1, side_2, side_3])

    (2 * side_1) + (2 * side_2) + (2 * side_3) + extra
  end

  def calc_individual_ribbon_length([l, w, h]) do
    side_1 = l + l + w + w
    side_2 = w + w + h + h
    side_3 = h + h + l + l
    shortest_perimeter = Enum.min([side_1, side_2, side_3])
    cubic_ft_volume = l * w * h

    shortest_perimeter + cubic_ft_volume
  end

  defp prepare_input(input) do
    input
    |> String.strip()
    |> String.split("\n")
    |> Enum.map(fn(measurements) ->
         measurements
         |> String.split("x")
         |> Enum.map(fn(i) ->
              String.to_integer(i)
            end)
       end)
  end
end
