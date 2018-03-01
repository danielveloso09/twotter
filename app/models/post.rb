class Post < ApplicationRecord
  belongs_to :user

  scope :followed_users_posts, -> (current_user) { where(user_id: current_user.followed_users) }

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
