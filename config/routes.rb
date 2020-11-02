Rails.application.routes.draw do
  get 'buy/detail'
  get 'buy/done'
  get 'detail/done'
  get 'users/save'
  get 'users/payment'
  get 'top/index'
  post 'top/company_logout' => 'top#company_logout'
  post 'top/user_logout' => 'top#user_logout'
  get 'topics/new'
  get 'replies/new'
  get 'top/company_login' => 'top#company_login_form'
  post 'company_login' =>'top#company_login'
  get 'top/user_login' => 'top#user_login_form'
  post 'user_login' => 'top#user_login'
  post 'top/index' => 'top#company_logout'
  post 'top/index' => 'top#user_logout'
  get 'posts/new'
  get 'companies/new'
  get 'companies/edit'
  post 'companies/fix'
  post'companies/create'
  get 'companies/:id' => 'companies#show'
  get 'companies/show'
  get 'users/index'
  get 'users/new'
  post 'users/create'
  get 'users/:id' => 'users#show'
  get 'users/:id/edit' => 'users#edit'
  get 'posts/:id/new' => 'posts#new'
  post 'posts/:id/create' => 'posts#create'
  get 'posts/index'
  get 'posts/:id' => 'posts#show'
  get 'replies/:post_id/new' => 'replies#new'
  post 'replies/create'
  get 'posts/show'
  get 'topics/new'
  post 'topics/create'
  get  'companies/show'
  get 'topics/index'
  post 'likes/create' => 'likes#create'
  get 'card/new'
  post 'card/create'
  get 'card/show'
  post 'card/delete'
  get 'buy/:reply_id/detail' => 'buy#detail'
  post 'buy/pay'
  get 'buy/:topic_id/topic_detail' => 'buy#topic_detail'
  post 'buy/topic_pay'
  get 'buy/:like_id/like_detail' => 'buy#like_detail'
  post 'buy/like_topic_pay'
  get 'buy/done'
  root 'top#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
