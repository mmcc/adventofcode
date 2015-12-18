defmodule AdventOfCodeTest.DayOne do
  use ExUnit.Case
  doctest AdventOfCode

  test "what_floor returns the final floor and the index of the floor that sends Santa to the basement" do
    assert {:ok, _, 0} = AdventOfCode.DayOne.what_floor("(())")
    assert {:ok, _, 0} = AdventOfCode.DayOne.what_floor("()()")
    assert {:ok, _, 3} = AdventOfCode.DayOne.what_floor("(((")
    assert {:ok, _, 3} = AdventOfCode.DayOne.what_floor("(()(()(")
    assert {:ok, _, 3} = AdventOfCode.DayOne.what_floor("))(((((")
    assert {:ok, _, -1} = AdventOfCode.DayOne.what_floor("())")
    assert {:ok, _, -1} = AdventOfCode.DayOne.what_floor("))(")
    assert {:ok, _, -3} = AdventOfCode.DayOne.what_floor(")))")
    assert {:ok, _, -3} = AdventOfCode.DayOne.what_floor(")())())")
  end

  test "what_floor returns the index at which Santa had to go to the basement" do
    assert {:ok, 1, _} = AdventOfCode.DayOne.what_floor(")")
    assert {:ok, 5, _} = AdventOfCode.DayOne.what_floor("()())")
  end
end
