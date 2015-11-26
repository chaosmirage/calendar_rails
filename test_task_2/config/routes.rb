Rails.application.routes.draw do
  root 'sessions#new'

  get 'signup', to: 'users#new'
  # get 'signin', to: 'sessions#new'
  delete 'singout', to: 'sessions#destroy'

  resource :session, only: [:new, :create, :destroy]
  resources :events
  resources :users

end
