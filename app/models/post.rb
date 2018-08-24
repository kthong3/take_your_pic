class Post < ApplicationRecord
  belongs_to :creator, class_name: :User, foreign_key: :creator_id
  validates :creator, presence: true
  validates :content, presence: true
  has_one_attached :image
end
