Rails.application.routes.draw do
  root to: "welcome#index"


  resources :sessions
  delete '/logout' => 'sessions#destroy'

  resources :users

  resources :posts

  resources :citys

end
