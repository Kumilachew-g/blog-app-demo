class Like < ApplicationRecord
    belongs_to :post
    belongs_to :author, class_name: 'User', foreign_key: :user_id

    def update_likes_count   
    end
end
