Rails.application.routes.draw do
  get 'requests/index'
  get 'dashboard/index'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  resources :requests do
    get  'search',  on: :collection
    resources :comments, except: [:index, :new, :show] do
      member do
        get :reply
      end
    end
  end

  root to: 'sessions#new'
end
