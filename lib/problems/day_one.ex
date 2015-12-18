defmodule AdventOfCode.DayOne do
  def run do
    File.read!("inputs/day_one.txt") |> what_floor()
  end

  def what_floor(input) do
    input = input |> String.split("")

    {_, basement_visit, final_floor} = Enum.reduce(input, {0, false, 0}, fn(direction, {i, initial_basement_visit, total}) ->
      i = i + 1

      total = total + direction_value(direction)

      if !initial_basement_visit && santa_in_basement?(total) do
        initial_basement_visit = i
      end

       {i, initial_basement_visit, total}
     end)

     {:ok, basement_visit, final_floor}
  end

  defp direction_value(direction) do
    case direction do
      "(" ->
        1
      ")" ->
        -1
      _ ->
        0
     end
  end

  defp santa_in_basement?(total) do
    total <= -1
  end
end
