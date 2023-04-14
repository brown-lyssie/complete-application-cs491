defmodule GameLibraryWeb.OperatingSystemLive.Index do
  use GameLibraryWeb, :live_view

  alias GameLibrary.GameDB
  alias GameLibrary.GameDB.OperatingSystem

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :operatingsystems, GameDB.list_operatingsystems())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Operating system")
    |> assign(:operating_system, GameDB.get_operating_system!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Operating system")
    |> assign(:operating_system, %OperatingSystem{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Operatingsystems")
    |> assign(:operating_system, nil)
  end

  @impl true
  def handle_info({GameLibraryWeb.OperatingSystemLive.FormComponent, {:saved, operating_system}}, socket) do
    {:noreply, stream_insert(socket, :operatingsystems, operating_system)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    operating_system = GameDB.get_operating_system!(id)
    {:ok, _} = GameDB.delete_operating_system(operating_system)

    {:noreply, stream_delete(socket, :operatingsystems, operating_system)}
  end
end
