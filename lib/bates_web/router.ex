defmodule BatesWeb.Router do
  use BatesWeb, :router

  pipeline :api do
    plug :accepts, ["json"]

    plug Plug.Parsers,
      parsers: [:urlencoded, :multipart, :json, Absinthe.Plug.Parser],
      pass: ["*/*"],
      json_decoder: Jason

    plug Absinthe.Plug,
      schema: BatesWeb.Schema
  end

  scope "/api", BatesWeb do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL, schema: BatesWeb.Schema
    forward "/", Absinthe.Plug, schema: BatesWeb.Schema
  end

  # Enable Swoosh mailbox preview in development
  if Application.compile_env(:bates, :dev_routes) do
    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
