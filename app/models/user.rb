class User < ApplicationRecord
  has_secure_password

  has_many :posts

  has_one :student

  has_one :teacher

  # validates :name, presence: true
  validates :username, presence: true, uniqueness: true

  enum role: [:admin, :teacher, :student]
end
