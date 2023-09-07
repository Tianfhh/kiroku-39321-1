class Entry < ApplicationRecord

  validates :image, presence: true
  validates :title, presence: true
  validates :text, presence: true
  

  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  has_one_attached :image

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
  
end
