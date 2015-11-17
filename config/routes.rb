Rails.application.routes.draw do
  root to: "welcome#index"


  resources :sessions
  delete '/logout' => 'sessions#destroy'

  resources :users

  resources :posts do
    resources :comments
  end

  resources :cities

end
