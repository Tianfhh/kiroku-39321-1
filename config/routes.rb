Rails.application.routes.draw do
  
  devise_for :users
  get 'entries/index'
  root to: "entries#index"

  resources :entries, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resource :likes, only: [:create, :destroy]
    resources :comments, only: :create
  end

  resources :entries, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    
  end

  resources :users do
    resource :relationships, only: [:create, :destroy]
  end

  resources :users, only: [:show]

end
