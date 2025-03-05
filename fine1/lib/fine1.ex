defmodule Fine1 do
  @on_load :load_nif

  defp load_nif do
    :erlang.load_nif(~c"#{__DIR__}/../priv/fine1", 0)
  end

  def fine1_add(_x, _y) do
    :erlang.nif_error("nif not loaded")
  end
end
