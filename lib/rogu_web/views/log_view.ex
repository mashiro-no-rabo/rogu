defmodule RoguWeb.LogView do
  use RoguWeb, :view

  def authed?(conn), do: Plug.Conn.get_session(conn, :login)
end
