Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :products
  resources :categories
  resources :orders, only: %i[index create show destroy]
  resources :line_items, only: %i[create update destroy]
  resources :payments, only: %i[edit update]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'products#index'
  get '/cart', to: 'carts#show', as: :cart
  # put '/orders/payment', to: 'orders#payment', as: 'order_payment'
  # put 'orders/:id/order_pay', to: 'orders#order_pay', as: 'order_pay'
  # put '/orders/confirm_payment', to: 'orders#confirm_payment', as: 'confirm_payment'
end
