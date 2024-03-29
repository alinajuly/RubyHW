Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  resources :products
  resources :categories

  # Defines the root path route ("/")
  root 'products#index'
end
