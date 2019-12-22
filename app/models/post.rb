class Post < ApplicationRecord
  mount_uploader :cover, CoverUploader
  belongs_to :category
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def is_liked(user)
    Like.find_by(user_id: user.id, post_id: id)
  end
end
