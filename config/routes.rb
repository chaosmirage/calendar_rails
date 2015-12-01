Rails.application.routes.draw do

  root 'sessions#new'

  get 'signup', to: 'registrations#new'
  get 'dashboard', to: 'events#index'
  get 'settings', to: 'users#edit'

  resource :session, only: [:new, :create, :destroy]
  resources :registrations, only: [:new, :create]
  resources :users, only: [:edit, :update]
  resources :events

end
