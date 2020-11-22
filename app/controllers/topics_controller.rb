class TopicsController < ApplicationController
  def new
    @topic = Topic.new
  end
  
  def create
    @topic = Topic.new
    @topic.company_id = current_company.id
    @topic.content = params[:content]
    @topic.price = params[:price]
    @topic.image_name = params[:image_name]
    #binding.pry
    if @topic.save
      flash[:notice] = "送信が完了しました"
      redirect_to("/companies/show")
    else
      render :new
    end
  end
  
  def show
    @topics = Topic.all.order(created_at: :desc)
  end
  
end
