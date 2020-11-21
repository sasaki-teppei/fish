Rails.application.routes.draw do
  root 'tops#index'
  
  resources :tops do
    
    collection do
      get 'company_login_form' 
      get 'user_login_form'
      post 'company_login'
      post 'user_login'
    end
  
  end
  
  resources :companies do
    post 'companies/:topic_id/ship' => 'companies#ship'
    post 'companies/:reply_id/reply_ship' => 'companies#reply_ship'
    post 'companies/transfer'
    
     collection do
       get 'trade'
       get 'point'
     end
      
  end
  
  resources :users do 
    post 'users/:topic_id/point' => 'users#point'
    post 'users/:reply_id/reply_point' => 'users#reply_point'
    
    collection do
      get 'save'
      get 'paytment'
      get 'trade'
    end
  
  end
  
  resources :posts 

  get 'replies/:post_id/new' => 'replies#new'
  post 'replies/create'
  
  resources :topics
  
  resources :card do
    
    collection do
      post 'delete'
    end
    
  end
  
  post 'likes/create' => 'likes#create'
  
  resource :buy do
    get 'buy/:reply_id/detail' => 'buy#detail'
    post 'buy/pay'
    get 'buy/:topic_id/topic_detail' => 'buy#topic_detail'
    post 'buy/topic_pay'
    get 'buy/:like_id/like_detail' => 'buy#like_detail'
    post 'buy/like_topic_pay'
    get 'buy/done'
    
    member do
        get 'like_detail'
    end
    
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
