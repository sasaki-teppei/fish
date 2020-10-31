class UsersController < ApplicationController
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_name: params[:user_name], name: params[:name], phone_number: params[:phone_number], email: params[:email], address: params[:address], password: params[:password])
        if @user.save
          session[:user_id] = @user.id
          redirect_to ("/users/#{@user.id}")
        end
    end
    
    def show
        @user = User.find_by(id: params[:id])
        @post = Post.find_by(user_id: current_user.id)
    end
    
    def index
        @replies = Reply.where(post_id: params[:post_id])
    end
    
    def save
        @likes = Like.where(user_id: current_user.id) 
    end
    
end
