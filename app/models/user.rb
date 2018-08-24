class User < ApplicationRecord
  validates :name, :username, :email, presence: true
  validates :username, :email, uniqueness: true
  has_many :posts, dependent: :destroy

  has_secure_password
end
