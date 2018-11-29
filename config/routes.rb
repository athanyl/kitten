Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  get '/users', to: 'home#users'

  get '/about', to: 'home#about'

  get '/cart', to: 'cart#show'
  get '/new_cart', to: 'cart#create_cart'
  patch '/cart/:id/update', to: 'cart#update', as: 'update_cart'
  resources :cart
  resources :charges
end
