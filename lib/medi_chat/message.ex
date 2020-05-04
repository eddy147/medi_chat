defmodule MediChat.Message do
  use Ecto.Schema
  import Ecto.Changeset

  schema "message" do
    field :message, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:name, :message])
    |> validate_required([:name, :message])
  end

  def get_messages(limit \\20) do
    MediChat.Repo.all(MediChat.Message, limit: limit)
  end
end
