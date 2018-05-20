Rails.application.routes.draw do
  resources :users, only: [:create, :new]
  resources :properties do
    get '/bookings/dates', to: 'bookings#dates'
    resources :bookings, only: [:create, :update]
  end

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  scope :dashboard do
    get '/', to: 'users#dashboard'
    get 'my_properties', to: 'properties#my_properties'
    get 'my_bookings', to: 'bookings#my_bookings'
  end

  root 'properties#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
