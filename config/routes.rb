Rails.application.routes.draw do
  resources :reviews
  get 'galleries/show'

  resources :images
  resources :albums
  resources :galleries

  get 'sessions/new'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'logout', to: 'sessions#destroy'
  get '/albums/new', to: 'albums#new'
  resources :users
  resources :sessions
  resources :photos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  get 'services', to: 'home#services'
  get 'gallery', to: 'images#index'
  get 'contact', to: 'home#contact'
end
