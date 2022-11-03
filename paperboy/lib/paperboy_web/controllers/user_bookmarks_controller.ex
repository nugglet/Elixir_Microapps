defmodule PaperboyWeb.UserBookmarksController do
  use PaperboyWeb, :controller

  def view(conn, _params) do
    render(conn, "bookmarks.html")
  end

end
