defmodule Insta.Router do
  use Insta.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Insta.Auth, repo: Insta.Repo
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Insta do
    pipe_through :browser # Use the default browser stack

    get "/", PostController, :index
    resources "posts", PostController
    resources "users", UserController
    resources "sessions", SessionController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Insta do
  #   pipe_through :api
  # end
end
