defmodule AppTest do
  use ExUnit.Case

  test "fine1" do
    assert Fine1.fine1_add(1, 2) == 3
  end

  test "fine2" do
    assert Fine2.fine2_add(1, 2) == 3
  end
end
