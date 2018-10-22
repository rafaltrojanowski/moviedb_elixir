defmodule Moviedb.Repo.Migrations.CreateMovies do
  use Ecto.Migration

  def change do
    create table(:movies) do
      add :title, :string
      add :description, :text

      timestamps()
    end

  end
end
