class Post < ApplicationRecord
  belongs_to :creator, class_name: :User
  validates :creator, presence: true
  validates :content, presence: true
  has_one_attached :image
end
