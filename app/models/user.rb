class User < ApplicationRecord
  rolify
  
  after_create :assign_admin_role
  after_create :assign_default_role
  
   def assign_admin_role
     self.add_role(:admin) if self.name == 'admin'
   end
   
   def assign_default_role
     self.add_role(:guest) if self.roles.blank?
   end
  
    validates :user_name, {uniqueness: true, presence: true}
    validates :name, {presence: true, uniqueness: true}
    validates :email, {presence: true, uniqueness: true}
    #validates :email, format: { with:/\A[a-zA-Z0-9_\#!$%&`'*+\-{|}~^\/=?\.]+@[a-zA-Z0-9][a-zA-Z0-9\.-]+\z/ }
    validates :address, {presence: true, uniqueness: true}
    validates :password, {presence: true}
    #validates :password, format: { with:/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}+\z/}
    
    has_many :posts
    
    has_many :likes
    
    def posts
       return Post.where(user_id: self.id) 
    end
end
