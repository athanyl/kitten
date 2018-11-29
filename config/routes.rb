Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  get '/cart', to: 'cart#show'
  resources :cart
  resources :charges
end
