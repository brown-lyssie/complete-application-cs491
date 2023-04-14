defmodule GameLibraryWeb.OperatingSystemLive.Show do
  use GameLibraryWeb, :live_view

  alias GameLibrary.GameDB

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:operating_system, GameDB.get_operating_system!(id))}
  end

  defp page_title(:show), do: "Show Operating system"
  defp page_title(:edit), do: "Edit Operating system"
end
