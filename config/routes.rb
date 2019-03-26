Rails.application.routes.draw do
  get 'requests/index'
  get 'dashboard/index'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  resource :requests

  #root to: "home#show"
  root to: 'sessions#new'
end
