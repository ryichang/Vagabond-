Rails.application.routes.draw do

  root to: "welcome#index"
  resources :users 


  resources :sessions

end
