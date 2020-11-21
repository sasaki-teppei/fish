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
    Payjp::Charge.create(
    :amount => params[:reply_price], 
    :customer => @card.customer_id,
    :currency => 'jpy',
    )
    @reply = Reply.find_by(id: params[:reply_id])
    @reply.buyer_id = current_user.id
    @reply.address = current_user.address
    @reply.save
    redirect_to ("/buy/done")
  end

  def topic_detail
    card = Card.where(user_id: current_user.id).first
    @topic = Topic.find_by(id: params[:topic_id])
    if card.blank?
      redirect_to("/users/show")
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end
  
  def topic_pay
    @card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
    :amount => params[:topic_price], 
    :customer => @card.customer_id,
    :currency => 'jpy',
    )
    @topic = Topic.find_by(id: params[:topic_id])
    @topic.buyer_id = current_user.id
    @topic.address = current_user.address
    @topic.save
    redirect_to ("/buy/done")
  end
  
  def like_detail
    card = Card.where(user_id: current_user.id).first
    @like = Like.find_by(id: params[:like_id])
    if card.blank?
      redirect_to("/users/show")
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end
  
  def like_topic_pay
    @card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
    :amount => params[:like_topic_price], 
    :customer => @card.customer_id,
    :currency => 'jpy',
    )
    @topic = Topic.find_by(id: params[:like_topic_id])
    @topic.buyer_id = current_user.id
    @topic.address = current_user.address
    @topic.save
    redirect_to ("/buy/done")
  end
end
