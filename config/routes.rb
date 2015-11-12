Rails.application.routes.draw do

  root to: "welcome#index"




  resources :sessions


  resources :users
  resources :posts
  resources :citys
end

