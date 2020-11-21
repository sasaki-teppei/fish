class PostsController < ApplicationController
  require 'payjp'
  
  def new
    @post = Post.new
    @user = User.find_by(id: current_user.id)
  end
  
  def create
    @post = Post.new(user_id: current_user.id, content: params[:content])
    @post.save
    redirect_to("/users/show")
  end
  
  def index
    @posts = Post.all.order(created_at: :desc)
  end
  
  def show
    @post = Post.find_by(id: params[:id], user_id: current_user.id)
  end
  
end
