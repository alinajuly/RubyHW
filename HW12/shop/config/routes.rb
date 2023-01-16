Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :products
  resources :categories
  resources :orders, only: %i[index create show]
  resources :line_items, only: %i[create update destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'products#index'
  get '/cart', to: 'carts#show', as: :cart
  put 'orders/:id/order_pay', to: 'orders#order_pay', as: 'order_pay'
end
