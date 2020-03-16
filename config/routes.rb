Rails.application.routes.draw do
  root 'pages#home'

  devise_for :users

  resources :users

  get '/trainer', to: 'users#trainer'


end
