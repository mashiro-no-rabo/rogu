defmodule Rogu.Life.Log do
  use Ecto.Schema
  import Ecto.Changeset


  schema "logs" do
    field :hyoudai, :string
    field :kiji, :string
    field :gengo, :string
    field :detsu, :date

    timestamps()

    field :display_date, :date, virtual: true
  end

  @doc false
  def changeset(log, attrs) do
    log
    |> cast(attrs, [:hyoudai, :kiji, :gengo, :detsu])
    |> validate_required([:kiji])
  end
end
