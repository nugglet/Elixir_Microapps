defmodule PaperboyWeb.PageController do
  use PaperboyWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
