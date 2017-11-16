defmodule HelloWeb.Router do
  # The first line of this module, use HelloWeb, :router, simply makes Phoenix
  # router functions available in our particular router.
  use HelloWeb, :router

  # The pipe_through :browser line will get a full treatment in the Pipeline
  # section of this guide. For now, you only need to know that pipelines allow a
  # set of middleware transformations to be applied to different sets of routes.
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

  # The first argument to these macros is the path. Here, it is the root of the
  # application, /. The next two arguments are the controller and action we want
  # to have handle this request. These macros may also take other options, which
  # we will see throughout the rest of this guide.
  scope "/", HelloWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    # resources, which expands out to eight clauses of the match/5 function.
    # user_path  GET     /users           HelloWeb.UserController :index
    # user_path  GET     /users/:id/edit  HelloWeb.UserController :edit
    # user_path  GET     /users/new       HelloWeb.UserController :new
    # user_path  GET     /users/:id       HelloWeb.UserController :show
    # user_path  POST    /users           HelloWeb.UserController :create
    # user_path  PATCH   /users/:id       HelloWeb.UserController :update
    #            PUT     /users/:id       HelloWeb.UserController :update
    # user_path  DELETE  /users/:id       HelloWeb.UserController :delete
    resources "/users", UserController
  end

  # Other scopes may use custom stacks.
  # scope "/api", HelloWeb do
  #   pipe_through :api
  # end
end

