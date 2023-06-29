defmodule BatesWeb.Schema do
  use Absinthe.Schema
  import_types(BatesWeb.Schema.Types.User)

  # alias BatesWeb.Resolvers

  query do
    field :users, :user do
      arg(:id, non_null(:id))

      resolve(&BatesWeb.Resolvers.Auth.get_user/3)
    end

    # @desc "Get all posts"
    # field :posts, list_of(:post) do
    #   resolve(&Resolvers.Content.list_posts/3)
    # end
  end
end