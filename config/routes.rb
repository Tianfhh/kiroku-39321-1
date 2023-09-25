Rails.application.routes.draw do
  
  devise_for :users
  get 'entries/index'
  root to: "entries#index"
  get 'users/index', to: 'users#index', as: 'index_user'
  get 'diaries/show', to: 'diaries#show', as: 'show_diary'

  resources :entries, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resource :likes, only: [:create, :destroy]
    resources :comments, only: :create
  end

  resources :users do
    resource :relationships, only: [:create, :destroy]
  end

  resources :users, only: [:show, :index]

  resources :diaries, only: [:show, :new, :create]

end
