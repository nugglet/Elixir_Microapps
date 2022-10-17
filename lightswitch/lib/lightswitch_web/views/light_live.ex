defmodule LightswitchWeb.LightLive do
  use LightswitchWeb, :live_view

  def mount(_params, _session, socket) do
    # init state by passing default (key, value) pairs to the socket using the function assign
    socket = assign(socket, :brightness, 10)
    {:ok, socket}
  end

  def render(assigns) do
    # assigns: map of key/value pairs we assigned to the socket in mount
    # ~H sigil defines an inlined LiveView template
    ~H"""
    <h1>Front Porch Light</h1>
    <div class="meter">
      <span style={"width: #{@brightness}%"}>
        <%= @brightness %>%
      </span>
    </div>

    <button phx-click="off">
      Off
    </button>

    <button phx-click="down">
      Down
    </button>

    <button phx-click="up">
      Up
    </button>

    <button phx-click="on">
      On
    </button>
    """
  end

  def handle_event("on", _, socket) do
    socket = assign(socket, :brightness, 100)
    {:noreply, socket}
  end

  def handle_event("off", _, socket) do
    socket = assign(socket, :brightness, 0)
    {:noreply, socket}
  end

  def handle_event("down", _, socket) do
    # Elixir shorthand capture syntax
    # max/min sets the max/min value acceptable
    socket = update(socket, :brightness, &max(&1 - 10, 0))
    {:noreply, socket}
  end

  def handle_event("up", _, socket) do
    socket = update(socket, :brightness, &min(&1 + 10, 100))
    {:noreply, socket}
  end

end
