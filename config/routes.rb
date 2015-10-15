Rails.application.routes.draw do

  root 'home#index'

  get "/profile", to: "users#show"
  resources :jobs, only: [:new, :show, :index]
  get "/jobs", to: "jobs#index"

  resources :businesses, only: [:new, :create]
  get "/company-dashboard", to: "businesses#show"

  resources :categories do
    resources :items, only: [:show, :index]
  end

  get "/watchlist", to: "watchlist#index"
  post "/watchlist", to: "watchlist#create"
  delete "/watchlist", to: "watchlist#delete"
  put "/watchlist", to: "watchlist#update"

  resources :orders, only: [:create, :index, :show, :update]

  get "/login", to: "sessions#new", :as => "login"
  post "/login", to: "sessions#create"
  get "/logout", to: 'sessions#destroy'
  delete "/logout", to: 'sessions#destroy'

  namespace 'admin' do
    get '/', to: 'dashboard#index', as: '/'
    resources :items
    resources :categories
  end

end
