Rails.application.routes.draw do
  
  get 'entries/index'
  root to: "entries#index"
end
