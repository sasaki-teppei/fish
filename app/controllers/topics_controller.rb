class TopicsController < ApplicationController
  def new
    @topic = Topic.new
  end
  
  def create
    @topic = Topic.new
    @topic.company_id = current_company.id
    @topic.content = params[:content]
    @topic.image_name = params[:image_name]
    #binding.pry
    if @topic.save
      redirect_to("/companies/#{@topic.company_id}")
    else
      render :new
    end
  end
  
  def index
    @topics = Topic.all.order(created_at: :desc)
  end
  
end
