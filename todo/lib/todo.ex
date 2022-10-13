defmodule Todo do
  alias Todo.Tasks.Task
  alias Todo.Repo
  @moduledoc """
  Todo keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  @topic inspect(__MODULE__)
  def subscribe do
    Phoenix.PubSub.subscribe(Todo.PubSub, @topic)
  end

  defp broadcast_change({:ok, result}, event) do
    Phoenix.PubSub.broadcast(Todo.PubSub, @topic, {__MODULE__, event, result})

    {:ok, result}
  end

  def create_todo(attrs \\ %{}) do
    %Task{}
    |> Task.changeset(attrs)
    |> Repo.insert()
    |> broadcast_change([:task, :created])
  end

  def update_todo(%Task{} = task, attrs) do
    task
    |> Task.changeset(attrs)
    |> Repo.update()
    |> broadcast_change([:task, :updated])
  end

  def delete_todo(%Task{} = task) do
    task
    |> Repo.delete()
    |> broadcast_change([:task, :deleted])
  end

end
