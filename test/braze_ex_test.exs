defmodule BrazeExTest do
  use ExUnit.Case
  doctest BrazeEx

  test "greets the world" do
    assert BrazeEx.hello() == :world
  end
end
