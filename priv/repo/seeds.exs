# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     SelphiCms.Repo.insert!(%SelphiCms.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.


alias SelphiCms.Repo
alias SelphiCms.Accounts.User
alias SelphiCms.Posts.Post

Repo.delete_all(User)
Repo.delete_all(Post)

[
  %User{email: "wang@qq.com", hashed_password: "12345678"},
  %User{email: "wang1@qq.com", hashed_password: "12345678"},
  %User{email: "wang2@qq.com", hashed_password: "12345678"},
  %User{email: "wang3@qq.com", hashed_password: "12345678"},
  %User{email: "wang4@qq.com", hashed_password: "12345678"},
  %User{email: "wang5@qq.com", hashed_password: "12345678"},
  %User{email: "wang6@qq.com", hashed_password: "12345678"},
  %User{email: "wang7@qq.com", hashed_password: "12345678"},
]
|> Enum.map(&Repo.insert/1)

[
  %Post{is_lock: 0, is_online: 1, title: "Post  1", content: "THIS IS CONTENT 1", read_count: 100, rating: 4.5, price: 5.0,  user_id: 1, cover: "https://api.lorem.space/image/shoes?w=160&h=160"},
  %Post{is_lock: 0, is_online: 1, title: "Post  2", content: "THIS IS CONTENT 2", read_count: 200, rating: 5.0, price: 16.30,  user_id: 1, cover: "https://api.lorem.space/image/shoes?w=160&h=160"},
  %Post{is_lock: 0, is_online: 1, title: "Post  3", content: "THIS IS CONTENT 3", read_count: 300, rating: 3.0, price: 26.30,  user_id: 1, cover: "https://api.lorem.space/image/shoes?w=160&h=160"},
  %Post{is_lock: 0, is_online: 1, title: "Post  4", content: "THIS IS CONTENT 4", read_count: 500, rating: 3.5, price: 36.30,  user_id: 1, cover: "https://api.lorem.space/image/shoes?w=160&h=160"},
  %Post{is_lock: 0, is_online: 1, title: "Post  5", content: "THIS IS CONTENT 5", read_count: 40, rating: 2.0, price: 46.30,  user_id: 1, cover: "https://api.lorem.space/image/shoes?w=160&h=160"},
  %Post{is_lock: 0, is_online: 1, title: "Post  6", content: "THIS IS CONTENT 6", read_count: 100, rating: 4.5, price: 5.0,  user_id: 2, cover: "https://api.lorem.space/image/shoes?w=160&h=160"},
  %Post{is_lock: 0, is_online: 1, title: "Post  7", content: "THIS IS CONTENT 7", read_count: 200, rating: 5.0, price: 16.30,  user_id: 2, cover: "https://api.lorem.space/image/shoes?w=160&h=160"},
  %Post{is_lock: 0, is_online: 1, title: "Post  8", content: "THIS IS CONTENT 8", read_count: 300, rating: 3.0, price: 26.30,  user_id: 2, cover: "https://api.lorem.space/image/shoes?w=160&h=160"},
  %Post{is_lock: 0, is_online: 1, title: "Post  9", content: "THIS IS CONTENT 9", read_count: 500, rating: 3.5, price: 36.30,  user_id: 2, cover: "https://api.lorem.space/image/shoes?w=160&h=160"},
  %Post{is_lock: 0, is_online: 1, title: "Post 10", content: "THIS IS CONTENT 10", read_count: 40, rating: 2.0, price: 46.30,  user_id: 2, cover: "https://api.lorem.space/image/shoes?w=160&h=160"},
  %Post{is_lock: 0, is_online: 1, title: "Post  11", content: "THIS IS CONTENT 11", read_count: 100, rating: 4.5, price: 5.0,  user_id: 3, cover: "https://api.lorem.space/image/shoes?w=160&h=160"},
  %Post{is_lock: 0, is_online: 1, title: "Post  12", content: "THIS IS CONTENT 12", read_count: 200, rating: 5.0, price: 16.30,  user_id: 3, cover: "https://api.lorem.space/image/shoes?w=160&h=160"},
  %Post{is_lock: 0, is_online: 1, title: "Post  13", content: "THIS IS CONTENT 13", read_count: 300, rating: 3.0, price: 26.30,  user_id: 3, cover: "https://api.lorem.space/image/shoes?w=160&h=160"},
  %Post{is_lock: 0, is_online: 1, title: "Post  14", content: "THIS IS CONTENT 14", read_count: 500, rating: 3.5, price: 36.30,  user_id: 3, cover: "https://api.lorem.space/image/shoes?w=160&h=160"},
  %Post{is_lock: 0, is_online: 1, title: "Post  15", content: "THIS IS CONTENT 15", read_count: 40, rating: 2.0, price: 46.30,  user_id: 3, cover: "https://api.lorem.space/image/shoes?w=160&h=160"},
  %Post{is_lock: 0, is_online: 1, title: "Post  16", content: "THIS IS CONTENT 16", read_count: 100, rating: 4.5, price: 5.0,  user_id: 4, cover: "https://api.lorem.space/image/shoes?w=160&h=160"},
  %Post{is_lock: 0, is_online: 1, title: "Post  17", content: "THIS IS CONTENT 17", read_count: 200, rating: 5.0, price: 16.30,  user_id: 4, cover: "https://api.lorem.space/image/shoes?w=160&h=160"},
  %Post{is_lock: 0, is_online: 1, title: "Post  18", content: "THIS IS CONTENT 18", read_count: 300, rating: 3.0, price: 26.30,  user_id: 4, cover: "https://api.lorem.space/image/shoes?w=160&h=160"},
  %Post{is_lock: 0, is_online: 1, title: "Post  19", content: "THIS IS CONTENT 19", read_count: 500, rating: 3.5, price: 36.30,  user_id: 4, cover: "https://api.lorem.space/image/shoes?w=160&h=160"},
  %Post{is_lock: 0, is_online: 1, title: "Post 20", content: "THIS IS CONTENT 20", read_count: 40, rating: 2.0, price: 46.30,  user_id: 4, cover: "https://api.lorem.space/image/shoes?w=160&h=160"},
  %Post{is_lock: 0, is_online: 1, title: "Post  21", content: "THIS IS CONTENT 21", read_count: 300, rating: 3.0, price: 26.30,  user_id: 5, cover: "https://api.lorem.space/image/shoes?w=160&h=160"},
  %Post{is_lock: 0, is_online: 1, title: "Post  22", content: "THIS IS CONTENT 22", read_count: 500, rating: 3.5, price: 36.30,  user_id: 5, cover: "https://api.lorem.space/image/shoes?w=160&h=160"},
  %Post{is_lock: 0, is_online: 1, title: "Post  23", content: "THIS IS CONTENT 23", read_count: 40, rating: 2.0, price: 46.30,  user_id: 5, cover: "https://api.lorem.space/image/shoes?w=160&h=160"},
  %Post{is_lock: 0, is_online: 1, title: "Post  24", content: "THIS IS CONTENT 24", read_count: 100, rating: 4.5, price: 5.0,  user_id: 6, cover: "https://api.lorem.space/image/shoes?w=160&h=160"},
  %Post{is_lock: 0, is_online: 1, title: "Post  25", content: "THIS IS CONTENT 25", read_count: 200, rating: 5.0, price: 16.30,  user_id: 6, cover: "https://api.lorem.space/image/shoes?w=160&h=160"},
  %Post{is_lock: 0, is_online: 1, title: "Post  26", content: "THIS IS CONTENT 26", read_count: 300, rating: 3.0, price: 26.30,  user_id: 6, cover: "https://api.lorem.space/image/shoes?w=160&h=160"},
  %Post{is_lock: 0, is_online: 1, title: "Post  27", content: "THIS IS CONTENT 27", read_count: 500, rating: 3.5, price: 36.30,  user_id: 7, cover: "https://api.lorem.space/image/shoes?w=160&h=160"},
  %Post{is_lock: 0, is_online: 1, title: "Post 28", content: "THIS IS CONTENT 28", read_count: 40, rating: 2.0, price: 46.30,  user_id: 7, cover: "https://api.lorem.space/image/shoes?w=160&h=160"},


]
|> Enum.map(&Repo.insert/1)