Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :posts do 
    resources :comments
  end
  

  post '/user/login', to: "sessions#create", as: "login"
  get '/user/show', to: "sessions#show", as: "show_user"

  match 'posts/:page' => 'posts#index', :constraints => {:page => /[0-9]+/}, via: [:get]

  get '/friend-request/send/:receiver_id', to: "friend_request#send_request", as: "send_request"
  get '/friend-request/accept/:id', to: "friend_request#accept_request", as: "accept_request"
  get '/friend-request/paddings', to: "friend_request#panding_request", as: "panding_request"
  get '/firend-request/friends/list', to: "friend_request#my_friends", as: "my_friends"

end
