defmodule Mix.Tasks.PhoenixWebpack.Generate do
  use Mix.Task

  @webpack "webpack@1.12.12"
  @webpack_command "npm install --save-dev #{@webpack}"
  @webpack_config """
  module.exports = {
    entry: "./web/static/js/app.js",
    output: {
      path: "./priv/static/js",
      filename: "app.js"
    }
  };
  """
  @watcher_command "watchers: [node: [\"node_modules/webpack/bin/webpack.js\", \"--watch\", \"--color\"]]"

  def run(_args) do
    install_webpack
    generate_webpack_config
    print_info
  end

  defp install_webpack do
    Mix.shell.info [:green, "* running ", :reset, @webpack_command]
    Mix.shell.cmd(@webpack_command, quiet: true)
  end

  defp generate_webpack_config do
    Mix.Generator.create_file("webpack.config.js", @webpack_config)
  end

  defp print_info do
    Mix.shell.info """

    Webpack is now installed! To enable live reloading
    change your watchers inside of `config/dev.exs` to:

        #{@watcher_command}
    """
  end
end
