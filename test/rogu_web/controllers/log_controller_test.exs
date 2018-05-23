defmodule RoguWeb.LogControllerTest do
  use RoguWeb.ConnCase

  alias Rogu.Life

  @create_attrs %{detsu: ~D[2010-04-17], gengo: "some gengo", hyoudai: "some hyoudai", kiji: "some kiji"}
  @update_attrs %{detsu: ~D[2011-05-18], gengo: "some updated gengo", hyoudai: "some updated hyoudai", kiji: "some updated kiji"}
  @invalid_attrs %{detsu: nil, gengo: nil, hyoudai: nil, kiji: nil}

  def fixture(:log) do
    {:ok, log} = Life.create_log(@create_attrs)
    log
  end

  describe "index" do
    test "lists all logs", %{conn: conn} do
      conn = get conn, log_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Logs"
    end
  end

  describe "new log" do
    test "renders form", %{conn: conn} do
      conn = get conn, log_path(conn, :new)
      assert html_response(conn, 200) =~ "New Log"
    end
  end

  describe "create log" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, log_path(conn, :create), log: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == log_path(conn, :show, id)

      conn = get conn, log_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Log"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, log_path(conn, :create), log: @invalid_attrs
      assert html_response(conn, 200) =~ "New Log"
    end
  end

  describe "edit log" do
    setup [:create_log]

    test "renders form for editing chosen log", %{conn: conn, log: log} do
      conn = get conn, log_path(conn, :edit, log)
      assert html_response(conn, 200) =~ "Edit Log"
    end
  end

  describe "update log" do
    setup [:create_log]

    test "redirects when data is valid", %{conn: conn, log: log} do
      conn = put conn, log_path(conn, :update, log), log: @update_attrs
      assert redirected_to(conn) == log_path(conn, :show, log)

      conn = get conn, log_path(conn, :show, log)
      assert html_response(conn, 200) =~ "some updated gengo"
    end

    test "renders errors when data is invalid", %{conn: conn, log: log} do
      conn = put conn, log_path(conn, :update, log), log: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Log"
    end
  end

  describe "delete log" do
    setup [:create_log]

    test "deletes chosen log", %{conn: conn, log: log} do
      conn = delete conn, log_path(conn, :delete, log)
      assert redirected_to(conn) == log_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, log_path(conn, :show, log)
      end
    end
  end

  defp create_log(_) do
    log = fixture(:log)
    {:ok, log: log}
  end
end
