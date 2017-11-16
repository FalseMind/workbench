defmodule HelloWeb.PageController do
  # The first line below the module definition invokes the __using__/1 macro of
  # the HelloWeb module, which imports some useful modules.
  use HelloWeb, :controller


  # The first parameter is always conn, a struct which holds information about
  # the request such as the host, path elements, port, query string, and much
  # more. conn, comes to Phoenix via Elixir’s Plug middleware framework.
  def index(conn, _params) do
    render conn, "index.html"
  end
  # The second parameter is params. Not surprisingly, this is a map which holds
  # any parameters passed along in the HTTP request. It is a good practice to
  # pattern match against params in the function signature to provide data in a
  # simple package we can pass on to rendering.
  def show(conn, %{"messenger" => messenger}) do
    render conn, "show.html", messenger: messenger
  end
end

# index - renders a list of all items of the given resource type
# show - renders an individual item by id
# new - renders a form for creating a new item
# create - receives params for one new item and saves it in a datastore
# edit - retrieves an individual item by id and displays it in a form for editing
# update - receives params for one edited item and saves it to a datastore
# delete - receives an id for an item to be deleted and deletes it from a datastore
