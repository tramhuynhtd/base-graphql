class User < ApplicationRecord
  has_secure_password

  has_many :posts

  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
end
