class Comment < ApplicationRecord
    blongs_to :post
    belongs_to :author, class_name: "User", foreign_key: :user_id

    after_save :update_comments_count

    private
    
    def update_comments_count
        post.update(comments_count: post.comments.size)    
    end
end
