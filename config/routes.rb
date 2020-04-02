Rails.application.routes.draw do
  get 'messages/index'
  devise_for :users
  root 'lobi#index'
  # post 'messages/:id' => 'messages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:edit, :update]
  resources :messages
  resources :groups, only: [:index, :new, :create, :edit, :update, :show] do
    resources :messages
  end
end
