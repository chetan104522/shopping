Rails.application.routes.draw do
  get 'product/index'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destory'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: 'products#index'
  resource :users, only: [:new, :create]

  get 'login', to: "sessions#new"
  post 'login',to: "sessions#create"

  get "logout", to: "sessions#destory"

  resources :products, only: :index
  resources :carts, only: [:index, :create, :destroy]
  # post '/carts',to: "carts#create"
  resources :orders, only: [:create]
  resources :line_items
end
