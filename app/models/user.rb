class User < ApplicationRecord
  has_many :followings
  has_many :followed_users, through: :followings

  has_many :followees, class_name: 'Following', foreign_key: 'followed_user_id'
  has_many :followee_users, through: :followees

  validates :email, format: {
    with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  }, length: { maximum: 80 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable

  def self.load_seed
    Settings.default_users.each do |key, attributes|
      attrs = attributes.to_h
      next unless User.where(email: attrs[:email]).first.blank?
      attrs[:name] = key.to_s.camelize
      attrs[:username] = key.to_s
      User.create!(attrs)
    end
  end
end
