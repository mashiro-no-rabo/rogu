defmodule RoguWeb.AuthController do
  use RoguWeb, :controller
  plug Ueberauth

  alias Ueberauth.Strategy.Helpers

  def request(conn, _params) do
    render(conn, "request.html", callback_url: Helpers.callback_url(conn) |> IO.inspect)
  end

  def delete(conn, _params) do
    conn
    |> put_flash(:info, "You have been logged out!")
    |> configure_session(drop: true)
    |> redirect(to: "/")
  end

  def callback(%{assigns: %{ueberauth_failure: _fails}} = conn, _params) do
    conn
    |> put_flash(:error, "Failed to authenticate.")
    |> redirect(to: "/")
  end

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do
    if auth.uid == "aquarhead" do
      conn
      |> put_flash(:info, "Successfully authenticated.")
      |> put_session(:login, true)
      |> redirect(to: "/")
    else
      conn
      |> put_flash(:error, "You're not me.")
      |> redirect(to: "/")
    end
  end
end
