defmodule Bates.Api do
  use Ash.Api,
    extensions: [
      AshGraphql.Api
    ]

  graphql do
    authorize? false
  end

  resources do
    registry Bates.Api.Registry
  end
end
