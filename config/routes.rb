Rails.application.routes.draw do
  root to: "home#index"
  resources :menus

  get '/menus', to: 'menus#index'
  #post '/additems', to: 'menus#create', as: :new_menus
  delete '/menus/:id', to: 'menus#destroy', as: :destroy_menus
  get '/addmenu', to: 'menus#addmenu'
  post '/addmenu', to: 'menus#create', as: :create_menus
  
  get '/cart', to: 'order_items#index'
  resources :order_items, path: '/cart/items'

  devise_for :users
  resources :users
  get "/signin", to: "sessions#new", as: :new_sessions
  post "/signin", to: "sessions#create", as: :sessions
  delete "/signout", to: "sessions#destroy",as: :destroy_session
  
  

  get '/cart/checkout', to: 'orders#new', as: :checkout
  patch '/cart/checkout', to: 'orders#create'   #since existing carts are used
  
  #since existing carts are used
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
