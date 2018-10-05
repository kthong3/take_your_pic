class User < ApplicationRecord
  has_many :posts, foreign_key: "creator_id", dependent: :destroy
  validates :name, :username, :email, presence: true
  validates :username, :email, uniqueness: true

  has_secure_password
end
