Rails.application.routes.draw do

  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :bookstores, except: [:new, :edit]

  root 'bookstores#index'
end
