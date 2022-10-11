Rails.application.routes.draw do


  root 'chatroom#index'
  get 'login', to: 'sessions#new'
  get 'signup', to: 'users#new'
  resources :users
  post 'login', to: 'sessions#create'
  post 'signup', to: 'users#create'
  delete 'user', to: 'users#destroy'
  delete 'logout', to: 'sessions#destroy'
  post 'message', to: 'messages#create'



end
