defmodule TodoWeb.TodoLive do
  use TodoWeb, :live_view
  alias Todo.Tasks

  def mount(_params, _session, socket) do
    Todo.subscribe()
    {:ok, fetch(socket)}
  end

  def handle_event("add", %{"task" => task}, socket) do
    Tasks.create_task(task)

    {:noreply, fetch(socket)}
  end

  def handle_event("toggle_done", %{"id" => id}, socket) do
    task = Tasks.get_task!(id)
    Tasks.update_task(task, %{done: !task.done})
    {:noreply, fetch(socket)}
  end

  def handle_event("delete", %{"ref" => ref}, socket) do
    task = Tasks.get_task!(ref)
    Tasks.delete_task(task)
    {:noreply, fetch(socket)}
  end

  defp fetch(socket) do
    assign(socket, tasks: Tasks.list_tasks())
  end

  def handle_info({Tasks, [:task | _], _}, socket) do
    {:noreply, fetch(socket)}
  end

end
