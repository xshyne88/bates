defmodule Bates.Api.Registry do
  use Ash.Registry,
    extensions: [
      # This extension adds helpful compile time validations
      Ash.Registry.ResourceValidations
    ]

  entries do
    entry Bates.Api.User
    entry Bates.Api.Token
  end
end
