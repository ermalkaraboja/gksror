Rails.application.routes.draw do

  #get 'home/index'

  root 'home#index'

  get '/' => 'application#show'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#login'
  post '/logout' => 'sessions#logout'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
