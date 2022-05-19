defmodule SelphiCms.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :content, :text
      add :cover, :string
      add :read_count, :integer
      add :rating, :float
      add :price, :float
      add :user_id, :integer
      add :is_lock, :integer
      add :is_online, :integer

      timestamps()
    end
  end
end
