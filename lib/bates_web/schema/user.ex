defmodule BatesWeb.Schema.Types.User do
  use Absinthe.Schema.Notation

  object :user do
    field :id, :id
  end
end
