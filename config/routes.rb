Rails.application.routes.draw do
  root to: "home#index"
  resources :menus

  get '/menus', to: 'menus#index'
  
  get '/cart', to: 'order_items#index'
  resources :order_items, path: '/cart/items'


  get '/cart/checkout', to: 'orders#new', as: :checkout
  patch '/cart/checkout', to: 'orders#create'   #since existing carts are used
  
  #since existing carts are used
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
