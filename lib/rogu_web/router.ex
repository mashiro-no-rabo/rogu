defmodule RoguWeb.Router do
  use RoguWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", RoguWeb do
    pipe_through :browser

    get "/auth", AuthController, :request
    get "/auth/callback", AuthController, :callback

    resources "/", LogController
  end
end
