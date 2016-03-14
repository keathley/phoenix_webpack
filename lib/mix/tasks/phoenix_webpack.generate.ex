defmodule Mix.Tasks.PhoenixWebpack.Generate do
  use Mix.Task

  @webpack "webpack@1.12.12"

  @webpack_config """
  module.exports = {
    entry: "./web/static/js/app.js",
    output: {
      path: "./priv/static/js",
      filename: "app.js"
    }
  };
  """

  def run(_args) do
    remove_brunch_config
    remove_node_modules
    install_webpack
    generate_webpack_config
  end

  defp remove_brunch_config do
    File.rm "brunch-config.js"
  end

  defp remove_node_modules do
    File.rm_rf "node_modules"
  end

  defp install_webpack do
    System.cmd("npm", ["install", "--save-dev", @webpack])
  end

  def generate_webpack_config do
    File.write("webpack.config.js", @webpack_config)
  end
end
