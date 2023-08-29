Rails.application.routes.draw do
  
  devise_for :users
  get 'entries/index'
  root to: "entries#index"

  resources :entries, only: [:index, :new, :create, :show, :edit, :update]
end
