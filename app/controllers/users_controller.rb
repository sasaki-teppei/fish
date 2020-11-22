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
          redirect_to ("/users/show")
        end
    end
    
    def show
        @user = User.find_by(id: current_user.id)
        @posts = Post.where(user_id: current_user.id).order(created_at: :desc)
    end
    
    def save
        @likes = Like.where(user_id: current_user.id) 
    end
    
    def trade
        @topics = Topic.where(buyer_id: current_user.id).order(created_at: :desc)
        @replies = Reply.where(buyer_id: current_user.id).order(created_at: :desc)
        @dones = Done.where(user_id: current_user.id)
    end
    
    def point
      @topic = Topic.find_by(id: params[:id])
      @company = Company.find_by(id: @topic.company.id)
      @topic.point = @topic.price
      @topic.save
      @company.point = @company.point + @topic.price
      if @company.save
        redirect_to("/users/show")
      else
        render :new
      end
    end
    
    def reply_point
      @reply = Reply.find_by(id: params[:id])
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
    
  def destroy
    session[:user_id] = nil
    redirect_to("/tops")
  end
  
end
