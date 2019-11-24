Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  namespace 'api' do
    resources :packages
    resources :destinations
    resources :dalam_negeris
    resources :luar_negeris
    resources :activities
    resources :catatan_perjalanans
    resources :socials
    put 'socials_multiple' => 'socials#update_multiple'
    resources :subscribes
    resources :faqs
    resources :slides

    resources :pages

    resources :settings

  end

  namespace 'api' do
  	resources :users, param: :_username
    post '/auth/login', to: 'authentication#login'
  	post '/auth/registration', to: 'authentication#registration'
  	# get '/*a', to: 'application#not_found'
    resources :travellers 
  end

  resources :packages
  resources :destinations
  resources :dalam_negeris
  resources :luar_negeris
  resources :activities
  resources :catatan_perjalanans
  resources :socials
  put 'socials_multiple' => 'socials#update_multiple'
  resources :subscribes
  resources :faqs
  resources :slides

  resources :pages
  put 'pages/home' => 'pages#update_home'
  put 'pages/home' => 'pages#update_home'
  put 'pages/home' => 'pages#update_home'
  put 'pages/home' => 'pages#update_home'
  put 'pages/home' => 'pages#update_home'
  put 'pages/home' => 'pages#update_home'
  put 'pages/home' => 'pages#update_home'
  put 'pages/home' => 'pages#update_home'
  put 'pages/home' => 'pages#update_home'

  resources :travellers, param: :_trav_email
  post '/auth/traveller/login', to: 'authentication_travellers#login'
  post '/auth/traveller/registration', to: 'authentication_travellers#registration' 
  
  get '*path', controller: 'application', action: 'not_found'

end

