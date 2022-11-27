class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :author, class_name: 'User', foreign_key: :user_id

  after_save :update_posts_count

  validates:title, presence: true, length: {maximum: 250}
  validates:comments_counter,likes_counter, numericality: {greater_than_or_equal_to: 0}

  def most_recent_five_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_posts_count
    user.update(posts_counter: user.posts.size)
  end
end
