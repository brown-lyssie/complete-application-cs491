defmodule GameLibrary.Repo.Migrations.CreateOperatingsystems do
  use Ecto.Migration

  def change do
    create table(:operatingsystems) do
      add :name, :string

      timestamps()
    end
  end
end
