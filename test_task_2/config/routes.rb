Rails.application.routes.draw do
  root 'sessions#new'

  get 'signin', to: 'sessions#new'
  get 'signup', to: 'registrations#new'
  delete 'singout', to: 'sessions#destroy'

  resource :session, only: [:new, :create, :destroy]
  resources :registrations, only: [:new, :create]
  resources :events
  resources :users

end
