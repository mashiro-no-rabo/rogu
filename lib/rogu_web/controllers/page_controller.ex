defmodule RoguWeb.PageController do
  use RoguWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
