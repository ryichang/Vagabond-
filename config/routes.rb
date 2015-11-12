Rails.application.routes.draw do

  root to: "welcome#index"




  resources :sessions


  resources :users, only: [:show, :new, :edit]
  resources :posts, only: [:show, :new]
  resources :citys, only: [:index, :show]
end

