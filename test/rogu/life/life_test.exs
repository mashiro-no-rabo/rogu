defmodule Rogu.LifeTest do
  use Rogu.DataCase

  alias Rogu.Life

  describe "logs" do
    alias Rogu.Life.Log

    @valid_attrs %{detsu: ~D[2010-04-17], gengo: "some gengo", hyoudai: "some hyoudai", kiji: "some kiji"}
    @update_attrs %{detsu: ~D[2011-05-18], gengo: "some updated gengo", hyoudai: "some updated hyoudai", kiji: "some updated kiji"}
    @invalid_attrs %{detsu: nil, gengo: nil, hyoudai: nil, kiji: nil}

    def log_fixture(attrs \\ %{}) do
      {:ok, log} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Life.create_log()

      log
    end

    test "list_logs/0 returns all logs" do
      log = log_fixture()
      assert Life.list_logs() == [log]
    end

    test "get_log!/1 returns the log with given id" do
      log = log_fixture()
      assert Life.get_log!(log.id) == log
    end

    test "create_log/1 with valid data creates a log" do
      assert {:ok, %Log{} = log} = Life.create_log(@valid_attrs)
      assert log.detsu == ~D[2010-04-17]
      assert log.gengo == "some gengo"
      assert log.hyoudai == "some hyoudai"
      assert log.kiji == "some kiji"
    end

    test "create_log/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Life.create_log(@invalid_attrs)
    end

    test "update_log/2 with valid data updates the log" do
      log = log_fixture()
      assert {:ok, log} = Life.update_log(log, @update_attrs)
      assert %Log{} = log
      assert log.detsu == ~D[2011-05-18]
      assert log.gengo == "some updated gengo"
      assert log.hyoudai == "some updated hyoudai"
      assert log.kiji == "some updated kiji"
    end

    test "update_log/2 with invalid data returns error changeset" do
      log = log_fixture()
      assert {:error, %Ecto.Changeset{}} = Life.update_log(log, @invalid_attrs)
      assert log == Life.get_log!(log.id)
    end

    test "delete_log/1 deletes the log" do
      log = log_fixture()
      assert {:ok, %Log{}} = Life.delete_log(log)
      assert_raise Ecto.NoResultsError, fn -> Life.get_log!(log.id) end
    end

    test "change_log/1 returns a log changeset" do
      log = log_fixture()
      assert %Ecto.Changeset{} = Life.change_log(log)
    end
  end
end
