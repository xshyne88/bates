defmodule BatesWeb.Schema.Types.User do
  use Absinthe.Schema.Notation

  object :user do
    field :name, :string
  end
end
