Rails.application.routes.draw do

  root 'chatroom#index'
  get 'login', to: 'sessions#new'
  resources :user, except:[:new]
  get 'signup', to: 'users#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

end
