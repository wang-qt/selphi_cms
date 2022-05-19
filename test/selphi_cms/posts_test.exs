defmodule SelphiCms.PostsTest do
  use SelphiCms.DataCase

  alias SelphiCms.Posts

  describe "posts" do
    alias SelphiCms.Posts.Post

    import SelphiCms.PostsFixtures

    @invalid_attrs %{content: nil, cover: nil, is_lock: nil, is_online: nil, price: nil, rating: nil, read_count: nil, title: nil, user_id: nil}

    test "list_posts/0 returns all posts" do
      post = post_fixture()
      assert Posts.list_posts() == [post]
    end

    test "get_post!/1 returns the post with given id" do
      post = post_fixture()
      assert Posts.get_post!(post.id) == post
    end

    test "create_post/1 with valid data creates a post" do
      valid_attrs = %{content: "some content", cover: "some cover", is_lock: 42, is_online: 42, price: 120.5, rating: 120.5, read_count: 42, title: "some title", user_id: 42}

      assert {:ok, %Post{} = post} = Posts.create_post(valid_attrs)
      assert post.content == "some content"
      assert post.cover == "some cover"
      assert post.is_lock == 42
      assert post.is_online == 42
      assert post.price == 120.5
      assert post.rating == 120.5
      assert post.read_count == 42
      assert post.title == "some title"
      assert post.user_id == 42
    end

    test "create_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Posts.create_post(@invalid_attrs)
    end

    test "update_post/2 with valid data updates the post" do
      post = post_fixture()
      update_attrs = %{content: "some updated content", cover: "some updated cover", is_lock: 43, is_online: 43, price: 456.7, rating: 456.7, read_count: 43, title: "some updated title", user_id: 43}

      assert {:ok, %Post{} = post} = Posts.update_post(post, update_attrs)
      assert post.content == "some updated content"
      assert post.cover == "some updated cover"
      assert post.is_lock == 43
      assert post.is_online == 43
      assert post.price == 456.7
      assert post.rating == 456.7
      assert post.read_count == 43
      assert post.title == "some updated title"
      assert post.user_id == 43
    end

    test "update_post/2 with invalid data returns error changeset" do
      post = post_fixture()
      assert {:error, %Ecto.Changeset{}} = Posts.update_post(post, @invalid_attrs)
      assert post == Posts.get_post!(post.id)
    end

    test "delete_post/1 deletes the post" do
      post = post_fixture()
      assert {:ok, %Post{}} = Posts.delete_post(post)
      assert_raise Ecto.NoResultsError, fn -> Posts.get_post!(post.id) end
    end

    test "change_post/1 returns a post changeset" do
      post = post_fixture()
      assert %Ecto.Changeset{} = Posts.change_post(post)
    end
  end
end
