defmodule SelphiCms.PostsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `SelphiCms.Posts` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        content: "some content",
        cover: "some cover",
        is_lock: 42,
        is_online: 42,
        price: 120.5,
        rating: 120.5,
        read_count: 42,
        title: "some title",
        user_id: 42
      })
      |> SelphiCms.Posts.create_post()

    post
  end
end
