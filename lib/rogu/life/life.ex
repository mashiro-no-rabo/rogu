defmodule Rogu.Life do
  @moduledoc """
  The Life context.
  """

  import Ecto.Query, warn: false
  alias Rogu.Repo

  alias Rogu.Life.Log

  @doc """
  Returns all logs, fill `display_date` with `detsu` first or `inserted_at`, then sort descent based on this
  """
  def list_logs do
    Repo.all(
      from l in Log,
      select: %{l | display_date: type(fragment("COALESCE(detsu, inserted_at)"), :date)},
      order_by: [desc: fragment("COALESCE(detsu, inserted_at)")]
    )
  end

  @doc """
  Gets a single log.
  """
  def get_log!(id) do
    query = Log |> select([l], %{l | display_date: type(fragment("COALESCE(detsu, inserted_at)"), :date)})
    Repo.get!(query, id)
  end

  @doc """
  Creates a log.
  """
  def create_log(attrs \\ %{}) do
    %Log{}
    |> Log.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a log.
  """
  def update_log(%Log{} = log, attrs) do
    log
    |> Log.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Log.
  """
  def delete_log(%Log{} = log) do
    Repo.delete(log)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking log changes.
  """
  def change_log(%Log{} = log) do
    Log.changeset(log, %{})
  end
end
