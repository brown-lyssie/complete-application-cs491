defmodule GameLibraryWeb.OperatingSystemLiveTest do
  use GameLibraryWeb.ConnCase

  import Phoenix.LiveViewTest
  import GameLibrary.GameDBFixtures

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  defp create_operating_system(_) do
    operating_system = operating_system_fixture()
    %{operating_system: operating_system}
  end

  describe "Index" do
    setup [:create_operating_system]

    test "lists all operatingsystems", %{conn: conn, operating_system: operating_system} do
      {:ok, _index_live, html} = live(conn, ~p"/operatingsystems")

      assert html =~ "Listing Operatingsystems"
      assert html =~ operating_system.name
    end

    test "saves new operating_system", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/operatingsystems")

      assert index_live |> element("a", "New Operating system") |> render_click() =~
               "New Operating system"

      assert_patch(index_live, ~p"/operatingsystems/new")

      assert index_live
             |> form("#operating_system-form", operating_system: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#operating_system-form", operating_system: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/operatingsystems")

      html = render(index_live)
      assert html =~ "Operating system created successfully"
      assert html =~ "some name"
    end

    test "updates operating_system in listing", %{conn: conn, operating_system: operating_system} do
      {:ok, index_live, _html} = live(conn, ~p"/operatingsystems")

      assert index_live |> element("#operatingsystems-#{operating_system.id} a", "Edit") |> render_click() =~
               "Edit Operating system"

      assert_patch(index_live, ~p"/operatingsystems/#{operating_system}/edit")

      assert index_live
             |> form("#operating_system-form", operating_system: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#operating_system-form", operating_system: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/operatingsystems")

      html = render(index_live)
      assert html =~ "Operating system updated successfully"
      assert html =~ "some updated name"
    end

    test "deletes operating_system in listing", %{conn: conn, operating_system: operating_system} do
      {:ok, index_live, _html} = live(conn, ~p"/operatingsystems")

      assert index_live |> element("#operatingsystems-#{operating_system.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#operatingsystems-#{operating_system.id}")
    end
  end

  describe "Show" do
    setup [:create_operating_system]

    test "displays operating_system", %{conn: conn, operating_system: operating_system} do
      {:ok, _show_live, html} = live(conn, ~p"/operatingsystems/#{operating_system}")

      assert html =~ "Show Operating system"
      assert html =~ operating_system.name
    end

    test "updates operating_system within modal", %{conn: conn, operating_system: operating_system} do
      {:ok, show_live, _html} = live(conn, ~p"/operatingsystems/#{operating_system}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Operating system"

      assert_patch(show_live, ~p"/operatingsystems/#{operating_system}/show/edit")

      assert show_live
             |> form("#operating_system-form", operating_system: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#operating_system-form", operating_system: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/operatingsystems/#{operating_system}")

      html = render(show_live)
      assert html =~ "Operating system updated successfully"
      assert html =~ "some updated name"
    end
  end
end
