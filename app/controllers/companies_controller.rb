class CompaniesController < ApplicationController
  def new
    @company = Company.new
  end
  
  def create
    @company = Company.new(company_name: params[:company_name], email: params[:email], phone_number: params[:phone_number], address: params[:address], password: params[:password], image_name: params[:image_name])
    @company.save
    redirect_to("/companies/#{@company.id}")
  end
  
  def show
    @company = Company.find_by(id: params[:id])
    @topic = Topic.find_by(company_id: params[:company_id])
  end
end
