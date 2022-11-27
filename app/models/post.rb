class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :author, class_name: 'User', foreign_key: :user_id

  after_save :update_posts_count

  def most_recent_five_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_posts_count
    author.update(posts_counter: author.posts.size)
  end
end
