defmodule Fine2 do
  @on_load :load_nif

  defp load_nif do
    :erlang.load_nif(~c"#{__DIR__}/../priv/fine2", 0)
  end

  def fine2_add(_x, _y) do
    :erlang.nif_error("nif not loaded")
  end
end
