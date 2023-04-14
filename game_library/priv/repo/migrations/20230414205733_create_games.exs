defmodule GameLibrary.Repo.Migrations.CreateGames do
  use Ecto.Migration

  def change do
    create table(:games) do
      add :name, :string
      add :description, :string
      add :operatingsystem_id, references(:operatingsystems, on_delete: :nothing)
      add :brand_id, references(:brands, on_delete: :nothing)

      timestamps()
    end

    create index(:games, [:operatingsystem_id])
    create index(:games, [:brand_id])
  end
end
