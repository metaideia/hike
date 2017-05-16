Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  root to: "admin/dashboard#index"

  namespace :api do
    resources :subscriptions, only: [:create]
    resources :payments, only: [:create]
    resources :payment_notifications, only: [:create]

    get '/subscription_confirmations/:id', to: 'subscription_confirmations#create', as: :subscription_confirmation
  end
end
