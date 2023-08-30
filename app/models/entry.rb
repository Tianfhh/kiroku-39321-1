class Entry < ApplicationRecord

  validates :image, presence: true
  validates :title, presence: true
  validates :text, presence: true
  

  belongs_to :user

  has_one_attached :image

  has_many :likes
  
end
