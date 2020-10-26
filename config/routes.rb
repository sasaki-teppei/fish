Rails.application.routes.draw do
  get 'users/save'
  get 'top/index'
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
  post'companies/create'
  get 'companies/:id' => 'companies#show'
  get 'companies/show'
  get 'users/index'
  get 'users/new'
  post 'users/create'
  get 'users/:id' => 'users#show'
  get 'users/:id/edit' => 'users#edit'
  get 'posts/buy'
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
  root 'top#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
