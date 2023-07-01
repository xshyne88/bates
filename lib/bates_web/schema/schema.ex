defmodule BatesWeb.Schema do
  use Absinthe.Schema
  # import_types(BatesWeb.Schema.Types.User)

  # alias BatesWeb.Resolvers
  @apis [Bates.Api]

  use AshGraphql, apis: @apis

  query do
    field :stuff, :string do
      fn _, _, _ -> {:ok, "bar"} end
    end
  end

  mutation do
  end

  # @desc "Get all posts"
  # field :posts, list_of(:post) do
  #   resolve(&Resolvers.Content.list_posts/3)
  # end
  # end

  # def context(ctx) do
  #   AshGraphql.add_context(ctx)
  # end

  def plugins() do
    [Absinthe.Middleware.Dataloader | Absinthe.Plugin.defaults()]
  end
end
