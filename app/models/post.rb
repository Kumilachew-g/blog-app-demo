class Post < ApplicationRecord
    has_many :comments
    has_many :likes
    belongs_to :author, class_name: 'User', foreign_key: :user_id

    def most_recent_five_comments  
    end
end
