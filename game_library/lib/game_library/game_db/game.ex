defmodule GameLibrary.GameDB.Game do
  alias GameLibrary.GameDB.OperatingSystem
  alias GameLibrary.GameDB.Brand
  use Ecto.Schema
  import Ecto.Changeset

  schema "games" do
    field :description, :string
    field :name, :string
    field :operatingsystem_id, :id
    field :brand_id, :id
    belongs_to :operatingsystem, OperatingSystem
    belongs_to :brand, Brand

    timestamps()
  end

  @doc false
  def changeset(game, attrs) do
    game
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
  end
end
