Rails.application.routes.draw do


  resources :students
  resources :users
  resources :courses do
    resources :assesments
  end
  #get 'home/index'

  root 'courses#index'

  #get '/' => 'application#show'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#login'
  post '/logout' => 'sessions#logout'
  get '/logout' => 'sessions#logout'

  #get '/students' => 'students#index'

  #resources :profile

  get '/profile/settings' => 'profile#edit'
  put '/profile/settings/update' => 'profile#update'
  
  get '/profile/change_password' => 'profile#change_password'
  put '/profile/update_password' => 'profile#update_password'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
