defmodule RoguWeb.AuthController do
  use RoguWeb, :controller
  plug Ueberauth

  alias Ueberauth.Strategy.Helpers

  def request(conn, _params) do
    render(conn, "request.html", callback_url: Helpers.callback_url(conn) |> IO.inspect)
  end

  def delete(conn, _params) do
    conn
    |> put_flash(:msg, "また会いましょう")
    |> delete_session(:login)
    |> redirect(to: "/")
  end

  def callback(%{assigns: %{ueberauth_failure: _fails}} = conn, _params) do
    conn
    |> put_flash(:msg, "失敗した")
    |> redirect(to: "/")
  end

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do
    if auth.uid == "aquarhead" do
      conn
      |> put_flash(:msg, "おかえりなさい")
      |> put_session(:login, true)
      |> redirect(to: "/")
    else
      conn
      |> put_flash(:msg, "Nei nei nei, þú ert ekki ég")
      |> redirect(to: "/")
    end
  end
end
