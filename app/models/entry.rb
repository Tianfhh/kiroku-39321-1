class Entry < ApplicationRecord

  validates :image, presence: true
  validates :title, presence: true
  validates :text, presence: true
  

  belongs_to :user

  has_one_attached :image

<<<<<<< HEAD
  has_many :likes

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
  
=======
>>>>>>> parent of db6b797 (モデル作成アソシエーション設定ルーティング設定)
end
