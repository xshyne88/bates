[
  import_deps: [
    :ecto,
    :phoenix,
    :ash,
    :ash_phoenix,
    :ash_postgres,
    :ecto_sql,
    :ash_authentication
  ],
  inputs: ["*.{ex,exs}", "{config,lib,test}/**/*.{ex,exs}", "priv/*/seeds.exs"],
  subdirectories: ["priv/*/migrations"]
]
