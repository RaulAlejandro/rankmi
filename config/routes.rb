Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  resources :requests do
    get  'search',  on: :collection
    resources :comments, except: [:index, :new, :show] do
    end
    member do
      put :like
      put :dislike
    end
  end

  root to: 'home#index'

end
