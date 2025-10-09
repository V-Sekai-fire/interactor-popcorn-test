defmodule HelloPopcorn.MixProject do
  use Mix.Project

  def project do
    [
      app: :hello_popcorn,
      version: "0.1.0",
      elixir: "~> 1.17",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: [
        build_wasm: ["popcorn.cook"]
      ]
    ]
  end

  def application do
    [
      extra_applications: [],
      mod: {HelloPopcorn.Application, []}
    ]
  end

  defp deps do
    [
      {:playwright, "~> 1.49.1-alpha.2", only: [:dev, :test]},
      {:popcorn, git: "https://github.com/V-Sekai-fire/popcorn", only: [:dev, :test]}
    ]
  end
end
