defmodule BatesWeb.Router do
  use BatesWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :graphql do
    plug Plug.Parsers,
      parsers: [:urlencoded, :multipart, :json, Absinthe.Plug.Parser],
      pass: ["*/*"],
      json_decoder: Jason
  end

  scope "/api" do
    pipe_through :api
    forward("/", Absinthe.Plug, schema: BatesWeb.Schema)
  end

  scope "/" do
    pipe_through :graphql
    forward "/graphiql", Absinthe.Plug.GraphiQL, schema: BatesWeb.Schema, playground: :advanced
  end

  # Enable Swoosh mailbox preview in development
  if Application.compile_env(:bates, :dev_routes) do
    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
