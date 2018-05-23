defmodule RoguWeb.PageControllerTest do
  use RoguWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Rogu"
  end
end
