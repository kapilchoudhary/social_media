Rails.application.routes.draw do
  resources :users

  post '/user/login', to: "sessions#create", as: "login"
  get '/user/show', to: "sessions#show", as: "show_user"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
