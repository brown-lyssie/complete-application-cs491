defmodule GameLibraryWeb.BrandLive.Index do
  use GameLibraryWeb, :live_view

  alias GameLibrary.GameDB
  alias GameLibrary.GameDB.Brand

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :brands, GameDB.list_brands())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Brand")
    |> assign(:brand, GameDB.get_brand!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Brand")
    |> assign(:brand, %Brand{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Brands")
    |> assign(:brand, nil)
  end

  @impl true
  def handle_info({GameLibraryWeb.BrandLive.FormComponent, {:saved, brand}}, socket) do
    {:noreply, stream_insert(socket, :brands, brand)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    brand = GameDB.get_brand!(id)
    {:ok, _} = GameDB.delete_brand(brand)

    {:noreply, stream_delete(socket, :brands, brand)}
  end
end
