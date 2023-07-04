[
  import_deps: [
    :ash,
    :ash_authentication,
    :ash_phoenix,
    :ash_postgres,
    :ecto,
    :ecto_sql,
    :phoenix
  ],
  inputs: ["*.{ex,exs}", "{config,lib,test}/**/*.{ex,exs}", "priv/*/seeds.exs"],
  subdirectories: ["priv/*/migrations"]
]
