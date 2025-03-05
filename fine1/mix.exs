defmodule Fine1.MixProject do
  use Mix.Project

  def project do
    [
      app: :fine1,
      version: "0.1.0",
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      compilers: [:elixir_make] ++ Mix.compilers(),
      make_env: fn ->
        %{
          "ERL_INCLUDE_DIR" => "#{:code.root_dir()}/usr/include",
          "FINE_INCLUDE_DIR" => Fine.include_dir()
        }
      end
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:fine, ">= 0.0.0"},
      {:elixir_make, ">= 0.0.0"}
    ]
  end
end
