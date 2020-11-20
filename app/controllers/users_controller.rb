class UsersController < ApplicationController
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_name: params[:user_name], 
                         name: params[:name],
                         phone_number: params[:phone_number],
                         email: params[:email],
                         address: params[:address],
                         password: params[:password])
        if @user.save
          session[:user_id] = @user.id
          LoginMailer.send_when_create(@user).deliver
          #binding.pry
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
    
    def trade
        @topics = Topic.where(buyer_id: current_user.id).order(created_at: :desc)
        @replies = Reply.where(buyer_id: current_user.id).order(created_at: :desc)
    end
    
    def point
      @topic = Topic.find_by(id: params[:topic_id])
      @company = Company.find_by(id: @topic.company.id)
      @topic.point = @topic.price
      @topic.save
      @company.point = @topic.price
      if @company.save
        redirect_to("/users/show")
      else
        render :new
      end
    end
    
    def reply_point
      @reply = Reply.find_by(id: params[:reply_id])
      @company = Company.find_by(id: @reply.company.id)
      @reply.point = @reply.price
      @reply.save
      @company.point = @reply.price
      if @company.save
        redirect_to("/users/show")
      else
        render :new
      end
    end
end
