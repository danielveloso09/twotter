class User < ApplicationRecord
  has_many :followings
  has_many :followed_users, through: followings 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable
end
