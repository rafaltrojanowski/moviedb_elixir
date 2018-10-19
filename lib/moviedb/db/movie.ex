defmodule Moviedb.DB.Movie do
  use Ecto.Schema
  import Ecto.Changeset


  schema "movies" do
    field :description, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(movie, attrs) do
    movie
    |> cast(attrs, [:title, :description])
    |> validate_required([:title, :description])
  end
end
