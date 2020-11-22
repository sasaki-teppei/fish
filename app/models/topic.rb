class Topic < ApplicationRecord
    belongs_to :company
    has_many :likes
    
    
    mount_uploader :image_name, ImageUploader
end
