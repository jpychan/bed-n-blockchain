Rails.application.routes.draw do
  resources :users
  resources :properties

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  scope :dashboard do
    get 'my_properties', to: 'properties#my_properties'
  end

  root 'properties#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
