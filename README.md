# Phoenix-Webpack

 `phoenix_webpack` makes it easy to include a basic webpack configuration with your react application.
 
## Installation
 
 Add `phoenix_webpack` to your mix dependencies:
 
 ```elixir
 defp deps do
  [{:phoenix_webpack, "~> 0.1", only: [:dev]}]
end
```

Now you can generate your webpack config:

```
mix deps.get
mix phoenix_webpack.generate
```

Brunch should be removed, Webpack should be installed and your package.json should be updated.

You will also need to update your watchers inside of the `config/dev.exs` file:

```elixir
watchers: [node: ["node_modules/webpack/bin/webpack.js", "--watch", "--color"]]
```

Congrats! You now have a working webpack config with phoenix.

## TODO

There is a lot here that I would like to do:

* Automatically update watchers in `config/dev.exs`
* Richer webpack configuration
* Basic React setup
* Support for hot-reloading out of the box
* Support for other assets like postcss, sass, less, images, fonts, etc.

## Contributing

The goal for `phoenix_webpack` is to have a community driven set of best practices for generating webpack and react applications. PRs, Issues, and comments are very welcome!

