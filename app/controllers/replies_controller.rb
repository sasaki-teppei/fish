class RepliesController < ApplicationController
  def new
    @reply = Reply.new
    @post_id = params[:post_id]
  end
  
  def create
    @reply = Reply.new
    @reply.company_id = current_company.id
    @reply.post_id = params[:post_id]
    @reply.content = params[:content]
    @reply.price = params[:price]
    @reply.image_name = params[:image_name]
    #binding.pry
    if @reply.save
      redirect_to("/companies/show")
    else
      redirect_to("/companies/trade")
    end
  end
  
end
