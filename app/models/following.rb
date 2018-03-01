class Following < ApplicationRecord
  belongs_to :user
  belongs_to :followed_user, class_name: 'User', foreign_key: 'followed_user_id'
  belongs_to :followee_user, class_name: 'User', foreign_key: 'user_id'
end
