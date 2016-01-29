defmodule EebBlog.Mixfile do
  use Mix.Project

  @version "0.1.0"
  
  def project do
    [app: :eeb_blog,
     version: @version,
     elixir: "~> 1.1",
     description: description,
     package: package,
     source_url: "https://github.com/aborn/eeb",
     homepage_url: "https://github.com/aborn/eeb",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps,
     test_coverage: [tool: ExCoveralls]]
  end

  def application do
    [env: [default: :value],
     applications: [:logger,:tzdata,:cowboy, :eeb],
    ]
  end

  defp description do
  """
  Elixir extendable blog.
  """
  end

  defp package do
    [
      maintainers: ["Aborn Jiang"],
      licenses: ["The MIT License (MIT)"],
      links: %{"GitHub" => "https://github.com/aborn/eeb"}]
  end
  
  defp deps do
    [{:earmark, "~> 0.1.19", only: :dev},
     {:ex_doc, "~> 0.11.1", only: :dev},
     {:timex, "~> 1.0.0"},
     {:cowboy, "~> 1.0" },
     {:plug, "~> 0.14" },
     {:excoveralls, "~> 0.4", only: :test},
     {:tzdata, "== 0.1.8", override: true},
     {:eeb, github: "aborn/eeb", only: :dev}]  
  end
end
