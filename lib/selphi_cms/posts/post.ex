defmodule SelphiCms.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :content, :string
    field :cover, :string
    field :is_lock, :integer
    field :is_online, :integer
    field :price, :float
    field :rating, :float
    field :read_count, :integer
    field :title, :string
#    field :user_id, :integer

    belongs_to(:user, SelphiCms.Accounts.User)

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :content, :cover, :read_count, :rating, :price, :user_id, :is_lock, :is_online])
    |> validate_required([:title, :content, :cover, :read_count, :rating, :price, :user_id, :is_lock, :is_online])
  end

  def changeset_lock(post, attrs) do
    post
    |> cast(attrs, [ :is_lock ])
    |> validate_required([:is_lock])
  end
end
