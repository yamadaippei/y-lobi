Rails.application.routes.draw do
  get 'messages/index'
  devise_for :users
  root 'lobi#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:edit, :update]
end
