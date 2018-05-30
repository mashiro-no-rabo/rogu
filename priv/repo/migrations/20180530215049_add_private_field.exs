defmodule Rogu.Repo.Migrations.AddPrivateField do
  use Ecto.Migration

  def change do
    alter table("logs") do
      add :private, :boolean, null: false, default: true
    end
  end
end
