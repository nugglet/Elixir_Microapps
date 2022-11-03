defmodule Paperboy.Repo do
  use Ecto.Repo,
    otp_app: :paperboy,
    adapter: Ecto.Adapters.Postgres

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      Paperboy.Repo,
    ]
  end
end

defmodule Paperboy.Repo.Papers do
  use Ecto.Schema
  alias Paperboy.Accounts.User

  schema "papers" do
    field :title, :string
    field :link, :string
    belongs_to :user, User
  end
end
