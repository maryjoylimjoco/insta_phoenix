defmodule Insta.Repo.Migrations.CreatePost do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :photo, :string
      add :caption, :text
      add :user_id, references(:users, on_delete: :nothing)

      timestamps
    end
    create index(:posts, [:user_id])

  end
end
