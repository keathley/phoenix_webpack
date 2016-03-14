defmodule Mix.Tasks.PhoenixWebpack.Generate do
  use Mix.Task

  def run(_args) do
    raise PhoenixWebpack.NotImplemented
  end
end

defmodule PhoenixWebpack.NotImplemented do
  defexception message: "This functionality is not implemented yet"
end
