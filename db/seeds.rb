User.load_seed
Post.load_seed

User.first.followed_users << User.last
