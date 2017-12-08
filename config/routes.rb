Rails.application.routes.draw do

  resources :courses
  #get 'home/index'

  root 'courses#index'

  #get '/' => 'application#show'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#login'
  post '/logout' => 'sessions#logout'
  get '/logout' => 'sessions#logout'

  #get '/students' => 'students#index'

  resources :students
  #resources :profile

  get '/profile/settings' => 'profile#edit'
  put '/profile/settings/update' => 'profile#update'
  
  get '/change_pass' => 'change_pass#edit'
  put '/change_pass/update' => 'change_pass#update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
