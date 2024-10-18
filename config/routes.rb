Rails.application.routes.draw do
  get "contacts/create"
  resources :users, only: [:show, :update]
  resources :professional_infos, only: [:index, :create, :update, :show]
  resources :personal_infos, only: [:index, :create, :update, :show]
  resources :posts, only: [:index, :create, :update, :show, :destroy]
  resources :contacts, only: [:create]
end
