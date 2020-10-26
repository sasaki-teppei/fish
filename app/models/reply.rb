class Reply < ApplicationRecord
    belongs_to :post
    belongs_to :company
    
    mount_uploader :image_name, ImageUploader
end
