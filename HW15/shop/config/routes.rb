require 'sidekiq/web'
require 'sidekiq-scheduler/web'

Rails.application.routes.draw do
  authenticate :admin_user do
    mount Sidekiq::Web => '/admin/sidekiq'
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  
  resources :products
  resources :categories
  resources :orders, only: %i[index create show destroy]
  resources :line_items, only: %i[create update destroy]
  resources :payments, only: %i[edit update]

  # Defines the root path route ("/")
  root 'products#index'
  get '/cart', to: 'carts#show', as: :cart
end
