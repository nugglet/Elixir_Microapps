defmodule LightswitchWeb.PageController do
  use LightswitchWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
