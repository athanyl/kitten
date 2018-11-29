Rails.application.routes.draw do
  get 'orders/show'
  get 'orders/index'
  get 'orders/new'
  get 'orders/create'
  get 'orders/update'
  get 'orders/destroy'
  get 'ord/new'
  get 'ord/destroy'
  get 'carters/show'
  get 'carters/index'
  get 'carters/new'
  get 'carters/create'
  get 'carters/edit'
  get 'carters/update'
  get 'carters/destroy'
  get 'cart/new'
  get 'cart/destroy'
  devise_for :users
  root 'home#index'

  get '/cart', to: 'cart#show'
  resources :cart
end
