defmodule MoviedbWeb.Router do
  use MoviedbWeb, :router

  pipeline :auth do
    plug Moviedb.Account.Pipeline
  end

  pipeline :ensure_auth do
    plug Guardian.Plug.EnsureAuthenticated
  end

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MoviedbWeb do
    pipe_through [:browser, :auth]

    get "/", MovieController, :index

    get "/login", SessionController, :new
    post "/login", SessionController, :login
    post "/logout", SessionController, :logout
  end

  scope "/", MoviedbWeb do
    pipe_through [:browser, :auth, :ensure_auth]

    resources "/movies", MovieController
  end

  # Other scopes may use custom stacks.
  # scope "/api", MoviedbWeb do
  #   pipe_through :api
  # end
end
