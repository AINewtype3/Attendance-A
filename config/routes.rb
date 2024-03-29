Rails.application.routes.draw do

  get 'applies/create'

  get 'sessions/new'

  root 'static_pages#top'
  get '/signup', to: 'users#new'
  get '/atwork', to: 'users#at_work'
  
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  
  resources :users do
    member do
      get 'edit_basic_info'
      patch 'update_basic_info'
      get 'attendances/edit_one_month'
      patch 'attendances/update_one_month'
    end
    resources :attendances, only: :update
    collection { post :import }
    
    resources :applies
  end
  
  resources :base_points
  
end
