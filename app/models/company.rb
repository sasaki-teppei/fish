class Company < ApplicationRecord
    validates :company_name, {uniqueness: true}
    validates :company_name, {presence: true}
    validates :email, {uniqueness: true}
    validates :email, format: { with:/\A[a-zA-Z0-9_\#!$%&`'*+\-{|}~^\/=?\.]+@[a-zA-Z0-9][a-zA-Z0-9\.-]+\z/ }
    validates :address, {presence: true, uniqueness: true}
    validates :password, format: { with:/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}+\z/}
    validates :email, {presence: true}
    validates :password, {presence: true}
    
    has_many :replies
    has_many :topics
    
    mount_uploader :profile_image, ImageUploader
end
