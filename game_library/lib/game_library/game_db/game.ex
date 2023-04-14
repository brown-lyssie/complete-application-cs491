defmodule GameLibrary.GameDB.Game do
  alias GameLibrary.GameDB.OperatingSystem
  alias GameLibrary.GameDB.Brand
  use Ecto.Schema
  import Ecto.Changeset

  schema "games" do
    field :description, :string
    field :name, :string
    belongs_to(:operatingsystem, OperatingSystem, foreign_key: :operatingsystem_id)
    belongs_to(:brand, Brand, foreign_key: :brand_id)

    timestamps()
  end

  @doc false
  def changeset(game, attrs) do
    game
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
  end
end
