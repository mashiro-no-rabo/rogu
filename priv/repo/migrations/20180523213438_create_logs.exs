defmodule Rogu.Repo.Migrations.CreateLogs do
  use Ecto.Migration

  def change do
    create table(:logs) do
      add :hyoudai, :string
      add :kiji, :text
      add :gengo, :string
      add :detsu, :date

      timestamps()
    end

  end
end
