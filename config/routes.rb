Rails.application.routes.draw do
  get 'sessions/new'

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  resources :entries

  resources :users do
    resources :entries
  end
  get 'signup'  => 'users#new'

  root to: 'visitors#index'
end
