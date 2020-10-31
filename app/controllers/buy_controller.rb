class BuyController < ApplicationController
  
  require 'payjp'
  
  def detail
    card = Card.where(user_id: current_user.id).first
    @reply = Reply.find_by(id: params[:reply_id])
    if card.blank?
      redirect_to("/users/show")
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end
  
  def pay
    @card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    #binding.pry
    Payjp::Charge.create(
    :amount => params[:reply_price], 
    :customer => @card.customer_id,
    :currency => 'jpy',
  )
  redirect_to ("/users/show")
  end

  def done
  end
end
