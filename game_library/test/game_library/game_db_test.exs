defmodule GameLibrary.GameDBTest do
  use GameLibrary.DataCase

  alias GameLibrary.GameDB

  describe "operatingsystems" do
    alias GameLibrary.GameDB.OperatingSystem

    import GameLibrary.GameDBFixtures

    @invalid_attrs %{name: nil}

    test "list_operatingsystems/0 returns all operatingsystems" do
      operating_system = operating_system_fixture()
      assert GameDB.list_operatingsystems() == [operating_system]
    end

    test "get_operating_system!/1 returns the operating_system with given id" do
      operating_system = operating_system_fixture()
      assert GameDB.get_operating_system!(operating_system.id) == operating_system
    end

    test "create_operating_system/1 with valid data creates a operating_system" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %OperatingSystem{} = operating_system} = GameDB.create_operating_system(valid_attrs)
      assert operating_system.name == "some name"
    end

    test "create_operating_system/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = GameDB.create_operating_system(@invalid_attrs)
    end

    test "update_operating_system/2 with valid data updates the operating_system" do
      operating_system = operating_system_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %OperatingSystem{} = operating_system} = GameDB.update_operating_system(operating_system, update_attrs)
      assert operating_system.name == "some updated name"
    end

    test "update_operating_system/2 with invalid data returns error changeset" do
      operating_system = operating_system_fixture()
      assert {:error, %Ecto.Changeset{}} = GameDB.update_operating_system(operating_system, @invalid_attrs)
      assert operating_system == GameDB.get_operating_system!(operating_system.id)
    end

    test "delete_operating_system/1 deletes the operating_system" do
      operating_system = operating_system_fixture()
      assert {:ok, %OperatingSystem{}} = GameDB.delete_operating_system(operating_system)
      assert_raise Ecto.NoResultsError, fn -> GameDB.get_operating_system!(operating_system.id) end
    end

    test "change_operating_system/1 returns a operating_system changeset" do
      operating_system = operating_system_fixture()
      assert %Ecto.Changeset{} = GameDB.change_operating_system(operating_system)
    end
  end

  describe "brands" do
    alias GameLibrary.GameDB.Brand

    import GameLibrary.GameDBFixtures

    @invalid_attrs %{name: nil}

    test "list_brands/0 returns all brands" do
      brand = brand_fixture()
      assert GameDB.list_brands() == [brand]
    end

    test "get_brand!/1 returns the brand with given id" do
      brand = brand_fixture()
      assert GameDB.get_brand!(brand.id) == brand
    end

    test "create_brand/1 with valid data creates a brand" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Brand{} = brand} = GameDB.create_brand(valid_attrs)
      assert brand.name == "some name"
    end

    test "create_brand/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = GameDB.create_brand(@invalid_attrs)
    end

    test "update_brand/2 with valid data updates the brand" do
      brand = brand_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Brand{} = brand} = GameDB.update_brand(brand, update_attrs)
      assert brand.name == "some updated name"
    end

    test "update_brand/2 with invalid data returns error changeset" do
      brand = brand_fixture()
      assert {:error, %Ecto.Changeset{}} = GameDB.update_brand(brand, @invalid_attrs)
      assert brand == GameDB.get_brand!(brand.id)
    end

    test "delete_brand/1 deletes the brand" do
      brand = brand_fixture()
      assert {:ok, %Brand{}} = GameDB.delete_brand(brand)
      assert_raise Ecto.NoResultsError, fn -> GameDB.get_brand!(brand.id) end
    end

    test "change_brand/1 returns a brand changeset" do
      brand = brand_fixture()
      assert %Ecto.Changeset{} = GameDB.change_brand(brand)
    end
  end

  describe "games" do
    alias GameLibrary.GameDB.Game

    import GameLibrary.GameDBFixtures

    @invalid_attrs %{description: nil, name: nil}

    test "list_games/0 returns all games" do
      game = game_fixture()
      assert GameDB.list_games() == [game]
    end

    test "get_game!/1 returns the game with given id" do
      game = game_fixture()
      assert GameDB.get_game!(game.id) == game
    end

    test "create_game/1 with valid data creates a game" do
      valid_attrs = %{description: "some description", name: "some name"}

      assert {:ok, %Game{} = game} = GameDB.create_game(valid_attrs)
      assert game.description == "some description"
      assert game.name == "some name"
    end

    test "create_game/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = GameDB.create_game(@invalid_attrs)
    end

    test "update_game/2 with valid data updates the game" do
      game = game_fixture()
      update_attrs = %{description: "some updated description", name: "some updated name"}

      assert {:ok, %Game{} = game} = GameDB.update_game(game, update_attrs)
      assert game.description == "some updated description"
      assert game.name == "some updated name"
    end

    test "update_game/2 with invalid data returns error changeset" do
      game = game_fixture()
      assert {:error, %Ecto.Changeset{}} = GameDB.update_game(game, @invalid_attrs)
      assert game == GameDB.get_game!(game.id)
    end

    test "delete_game/1 deletes the game" do
      game = game_fixture()
      assert {:ok, %Game{}} = GameDB.delete_game(game)
      assert_raise Ecto.NoResultsError, fn -> GameDB.get_game!(game.id) end
    end

    test "change_game/1 returns a game changeset" do
      game = game_fixture()
      assert %Ecto.Changeset{} = GameDB.change_game(game)
    end
  end
end
