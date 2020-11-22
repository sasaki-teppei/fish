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
    @topics = Topic.where(company_id: current_company.id).order(created_at: :desc)
  end
  
  def edit
    @company = Company.find_by(id: current_company.id)
  end
  
  def update
    @company = Company.find_by(id: current_company.id)
    @company.profile = params[:profile]
    @company.profile_image = params[:profile_image]
    if @company.save
      redirect_to("/companies/show")
    end
  end
  
  def trade
    @topics = Topic.where(company_id: current_company.id).where.not(buyer_id: nil).order(created_at: :desc)
    @replies = Reply.where(company_id: current_company.id).where.not(buyer_id: nil).order(created_at: :desc)
  end
  
  def ship
    @topic = Topic.find_by(id: params[:id])
    @topic.address = nil
    if @topic.save
      flash[:notice] = "発送通知が完了しました"
      redirect_to("/companies/show")
    else
      render :new
    end
  end
  
  def reply_ship
    @reply = Reply.find_by(id: params[:id])
    @reply.address = nil
    if @reply.save
      flash[:notice] = "発送通知が完了しました"
      redirect_to("/companies/show")
    else
      render :new
    end
  end
  
  def point
    @company = Company.find_by(id: current_company.id)
    @topics = Topic.where(id: current_company.id)
    @replies = Reply.where(id: current_company.id)
    @records = Record.where(company_id: current_company.id)
  end
  
  def transfer
    @company = Company.find_by(id: current_company.id)
    @record = Record.new
    @record.company_id = current_company.id 
    @record.record = @company.point
    @record.save
    @company.point = nil
    if @company.save
      flash[:notice] = "振り込み依頼が完了しました"
      redirect_to("/companies/show")
    end
  end
  
  def destroy
    session[:company_id] = nil
    redirect_to("/tops")
  end
  
end