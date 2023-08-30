Rails.application.routes.draw do
  
  devise_for :users
  get 'entries/index'
  root to: "entries#index"

  resources :entries, only: [:index, :new, :create, :show, :edit, :update, :destroy]

  resources :users do
    resource :relationships, only: [:create, :destroy]
  end

  resources :users, only: [:show]

end
