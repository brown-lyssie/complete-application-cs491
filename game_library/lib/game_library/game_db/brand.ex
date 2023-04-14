defmodule GameLibrary.GameDB.Brand do
  use Ecto.Schema
  import Ecto.Changeset
  alias GameLibrary.GameDB.Game
  schema "brands" do
    field :name, :string
    has_many :games, Game
    timestamps()
  end

  @doc false
  def changeset(brand, attrs) do
    brand
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
