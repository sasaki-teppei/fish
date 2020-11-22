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
    
     collection do
       get 'trade'
       get 'point'
       post 'transfer'
     end
     
     member do
       post 'ship'
       post 'reply_ship'
     end
      
  end
  
  resources :users do 

    collection do
      get 'save'
      get 'paytment'
      get 'trade'
    end
    
    member do
      post 'point'
      post 'reply_point'
    end
  
  end
  
  resources :topics
  
  resources :posts 
  
  resources :replies do
    
    member do
      get 'new'
    end
  
  end
  
  resources :card do
    
    collection do
      post 'delete'
    end
    
  end
  
  post 'likes/create' => 'likes#create'
  
  resources :payments do
    
    collection do
      get 'done'
      post 'pay'
      post 'topic_pay'
      post 'like_pay'
    end
    
    member do
      get 'detail'
      get 'topic_detail'
      get 'like_detail'
    end
    
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
