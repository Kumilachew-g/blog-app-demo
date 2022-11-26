class Comment < ApplicationRecord
    blongs_to :post
    belongs_to :author, class_name: "User", foreign_key: :user_id

    def update_comments_count    
    end
end
