class User < ApplicationRecord
  has_secure_password

  has_many :posts

  has_many :students, as: :information

  has_many :teachers, as: :information

  # validates :name, presence: true
  validates :username, presence: true, uniqueness: true
end
