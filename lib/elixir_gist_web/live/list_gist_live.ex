defmodule ElixirGistWeb.ListGistLive do
  use ElixirGistWeb, :live_view

  def mount(_params, _session, socket) do
    gists = ElixirGist.Gists.list_gists()
    {:ok, assign(socket, gists: gists)}
  end
end
