Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  get '/cart', to: 'cart#show'
  get '/new_cart', to: 'cart#create_cart'
  resources :cart
end
