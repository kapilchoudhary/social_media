Rails.application.routes.draw do
  resources :users
  resources :posts do 
    resources :comments
  end
  

  post '/user/login', to: "sessions#create", as: "login"
  get '/user/show', to: "sessions#show", as: "show_user"

  match 'posts/:page' => 'posts#index', :constraints => {:page => /[0-9]+/}, via: [:get]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
