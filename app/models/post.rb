class Post < ApplicationRecord
    validates :content, length: {maximum:140}
    
    belongs_to :user
    has_many :replies
end
