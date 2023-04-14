defmodule GameLibrary.GameDB.OperatingSystem do
  use Ecto.Schema
  import Ecto.Changeset
  alias GameLibrary.GameDB.Game

  schema "operatingsystems" do
    field :name, :string
    has_many :games, Game
    timestamps()
  end

  @doc false
  def changeset(operating_system, attrs) do
    operating_system
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
