Rails.application.routes.draw do
  root 'home#index'

  get "/profile", to: "users#show"
  resources :jobs, only: [:create, :new, :show, :index]
  get "/jobs", to: "jobs#index"

  get "/contact", to: "home#contact"
  get "/about", to: "home#about"
  get "/faq", to: "home#faq"

  resources :businesses, only: [:new, :create]

  namespace "business_admin" do
    get "/", to: "businesses#show"
  end

  get "/watchlist", to: "watchlist#index"
  post "/watchlist", to: "watchlist#create"
  delete "/watchlist", to: "watchlist#delete"
  put "/watchlist", to: "watchlist#update"

  get "/auth/github", as: :login
  get "/auth/github/callback", to: "sessions#create"
  delete "/logout", as: :logout, to: "sessions#destroy"

  namespace 'admin' do
    get '/', to: 'dashboard#index', as: '/'
  end

  get "/:slug", as: :business, to: "businesses#show"
end
