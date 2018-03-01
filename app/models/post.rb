class Post < ApplicationRecord
  belongs_to :user

<<<<<<< HEAD
  scope :myposts, -> (current_user) { where(user_id: [current_user.id] + current_user.followed_users).order(:created_at) }
=======
  scope :followed_users_posts, ->(current_user) { where(user_id: current_user.followed_users) }
>>>>>>> 3370dc4ca99a8942799cfe1185094b0330de2d4d

  def self.load_seed
    Settings.default_posts.each do |key, attributes|
      attrs = attributes.to_h
      user = User.find_by_username(attrs.delete(:username))
      next if user.blank?
      attrs[:user_id] = user.id
      Post.create!(attrs)
    end
  end
end
