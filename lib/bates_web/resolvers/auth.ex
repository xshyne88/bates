defmodule BatesWeb.Resolvers.Auth do
  def get_user(_, _, _) do
    {:ok, %{id: 1}}
  end
end
