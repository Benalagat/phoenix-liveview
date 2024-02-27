defmodule ElixirGistWeb.ListGistLive do
  use ElixirGistWeb, :live_view

  alias ElixirGist.Gists

  def mount(_params, _session, socket) do
    gists = Gists.list_gists()
    {:ok, assign(socket, gists: gists, page: 1)}
  end

  def handle_event("next", _params, socket) do
    %{assigns: %{page: page}} = socket
    new_page = page + 1
    new_gists = Gists.list_gists(new_page)
    {:noreply, assign(socket, gists: new_gists, page: new_page)}
  end

  def handle_event("prev_page", _params, socket) do
    %{assigns: %{page: page}} = socket
    new_page = max(page - 1, 1)
    new_gists = Gists.list_gists(new_page)
    {:noreply, assign(socket, gists: new_gists, page: new_page)}
  end

  def handle_event(_, _, socket), do: {:noreply, socket}
end
