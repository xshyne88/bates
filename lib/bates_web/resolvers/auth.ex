defmodule BatesWeb.Resolvers.Auth do
  def get_user(_, _, _) do
    {:ok, %{name: "idthing"}}
  end
end
