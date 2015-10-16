Rails.application.routes.draw do

  root 'home#index'

  get "/profile", to: "users#show"
  get "/signup", to: "users#new"
  resources :users, only: [:create, :edit, :update]
  resources :jobs, only: [:create, :new, :show, :index]
  get "/jobs", to: "jobs#index"

  resources :businesses, only: [:new, :create]

  namespace "business_admin" do
    get "/", to: "businesses#show"
  end

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
  end

  get "/:slug", as: :business, to: "businesses#show"
end
