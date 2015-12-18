defmodule AdventOfCodeTest.DayTwo do
  use ExUnit.Case
  doctest AdventOfCode

  test "calculate wrapping paper should how much paper is needed" do
    assert AdventOfCode.DayTwo.calc_individual_wrapping_paper([2,3,4]) == 58
    assert AdventOfCode.DayTwo.calc_individual_wrapping_paper([1,1,10]) == 43
  end

  test "calculate total feet of wrapping paper needed given a list of measurements" do
    input = """
            2x3x4
            1x1x10
            """
    assert AdventOfCode.DayTwo.calc_total_footage(input) == 101
  end

  test "calculate ribbon length determines the exact length necessary" do
    assert AdventOfCode.DayTwo.calc_individual_ribbon_length([2,3,4]) == 34
    assert AdventOfCode.DayTwo.calc_individual_ribbon_length([1,1,10]) == 14
  end

  test "calculate total ribbon length given a list of measurements" do
    input = """
            2x3x4
            1x1x10
            """
    assert AdventOfCode.DayTwo.calc_total_ribbon_length(input) == 48
  end
end
