Rails.application.routes.draw do
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
end
