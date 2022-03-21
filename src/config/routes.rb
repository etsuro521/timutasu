Rails.application.routes.draw do
  root 'static_pages#home'
  get '/signup', to: 'users#new'
  resources :users
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/confirm', to:'static_pages#confirm'
  get '/goals', to:'static_pages#goals'
  resources :tasks do
    collection do
      get :change
    end
  end
  resources :groups do
    member do
      post :change, :add
      get :search
    end
  end
  resources :user_groups, only: [:edit,:update,:destroy]
  resources :teams do
    member do
      post :change, :add
      get :search, :confirm
    end
  end
  resources :user_teams, only: [:destroy]
  resources :monthly_goals do
    collection do
      post :change, :store
    end
  end
  resources :weekly_goals do
    collection do
      post :store, :week, :whose
    end
  end
end

