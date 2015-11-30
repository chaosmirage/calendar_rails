Rails.application.routes.draw do
  # TODO: delete some resources

  root 'sessions#new'

  get 'signup', to: 'registrations#new'

  resource :session, only: [:new, :create, :destroy]
  resources :registrations, only: [:new, :create]
  resources :events
  resources :users

end
