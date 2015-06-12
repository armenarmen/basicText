Rails.application.routes.draw do
  get 'sessions/new'

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  resources :entries, only: [:show, :create]

  resources :users, only: [:show, :new, :edit, :create, :update, :destroy]
  
  get 'signup'  => 'users#new'

  root to: 'visitors#index'
end
