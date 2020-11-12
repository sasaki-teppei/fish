class CompaniesController < ApplicationController
  def new
    @company = Company.new
  end
  
  def create
    @company = Company.new(company_name: params[:company_name], 
                           email: params[:email], 
                           phone_number: params[:phone_number],
                           address: params[:address], 
                           password: params[:password],
                           image_name: params[:image_name] )
    if @company.save
      session[:company_id] = @company.id
      redirect_to("/companies/#{@company.id}")
    end
  end
  
  def show
    @company = Company.find_by(id: params[:id])
    @topic = Topic.find_by(company_id: params[:company_id])
  end
  
  def edit
    @company = Company.find_by(id: current_company.id)
  end
  
  def fix
    @company = Company.find_by(id: current_company.id)
    @company.profile = params[:profile]
    @company.profile_image = params[:profile_image]
    #binding.pry
    if @company.save
      redirect_to("/companies/show")
    end
  end
  
  def trade
    @topics = Topic.where(company_id: current_company.id, buyer_id: true)
    @replies = Reply.where(company_id: current_company.id, buyer_id: true)
  end
  
  def ship
    @topic = Topic.find_by(id: params[:topic_id])
    @topic.address = nil
    #binding.pry
    if @topic.save
      redirect_to("/companies/show")
    else
      render :new
    end
  end
  
  def reply_ship
    @reply = Reply.find_by(id: params[:reply_id])
    @reply.address = nil
    if @reply.save
      redirect_to("/companies/show")
    else
      render :new
    end
  end
  
  def point
    @company = Company.find_by(id: current_company.id)
    @topic = Topic.find_by(id: current_company.id)
  end
end