class Like < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User', foreign_key: :user_id

  after_save :update_likes_count
  after_destroy :update_likes_count

  private

  def update_likes_count
    post.update(likes_count: post.likes.size)
  end
end
