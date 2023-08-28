Rails.application.routes.draw do
  
  devise_for :users
  get 'entries/index'
  root to: "entries#index"
end
