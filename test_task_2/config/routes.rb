Rails.application.routes.draw do
  root 'users#new'

  resources :events
  resources :users



end
