defmodule NervesEv3SampleTest do
  use ExUnit.Case
  doctest NervesEv3Sample

  test "greets the world" do
    assert NervesEv3Sample.hello() == :world
  end
end
