Rails.application.routes.draw do
  root 'pages#home'

  devise_for :users,
             path: '',
             path_names: {sign_up: 'register', sign_in: 'login', edit: 'profile', sign_out: 'logout'},
             controllers: {omniauth_callbacks: 'omniauth_callbacks'}

  resources :users
  get '/trainers', to: 'users#trainers'

  post '/users/edit', to: 'users#update'
  # get 'my_page', to: 'users#show'
  resources :subscriptions

end
