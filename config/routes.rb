Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  get '/users', to: 'home#users'
  get '/about', to: 'home#about'
  get '/profil', to: 'home#show'

  get '/cart', to: 'cart#show'
  get '/new_cart', to: 'cart#create_cart'
  patch '/cart/:id/update', to: 'cart#update', as: 'update_cart'

  patch '/cart/:id/update_from_cart', to: 'cart#update_from_cart', as: 'update_cart_from_cart'

  patch '/cart/:id/update_less_from_cart', to: 'cart#update_less_from_cart', as: 'update_cart_less_from_cart'
  resources :cart
  resources :charges
end