class PostsController < ApplicationController
  def new
    @post = Post.new
    @user = User.find_by(id: params[:id])
  end
  
  def create
    @user = User.find_by(id: params[:id])
    @post = Post.new(user_id: current_user.id, content: params[:content])
    @post.save
    flash[:notice] = "投稿しました"
    redirect_to("/users/#{@user.id}")
  end
  
  def index
    @posts = Post.all.order(created_at: :desc)
  end
  
  def show
    @post = Post.find_by(id: params[:id], user_id: current_user.id)
  end
  
  def buy 
  end
  
  require 'payjp'

  def purchase
    Payjp.api_key = "秘密鍵"
    Payjp::Charge.create(
      amount: 809, # 決済する値段
      card: params['payjp-token'], # フォームを送信すると作成・送信されてくるトークン
      currency: 'jpy'
    )
  end
end
