defmodule Rogu.Life.Log do
  use Ecto.Schema
  import Ecto.Changeset


  schema "logs" do
    field :hyoudai, :string
    field :kiji, :string
    field :gengo, :string
    field :detsu, :date
    field :private?, :boolean, source: :private

    timestamps()

    field :display_date, :date, virtual: true
  end

  @doc false
  def changeset(log, attrs) do
    log
    |> cast(attrs, [:hyoudai, :kiji, :gengo, :detsu, :private?])
    |> validate_required([:kiji, :private?])
  end
end
