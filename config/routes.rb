Rails.application.routes.draw do
  root 'home#index'

  get "/profile", to: "users#show"
  get "/profile/edit", as: :edit_profile, to: "users#edit"
  put "/profile", to: "users#update"
  get "/watchlist", to: "watchlist#index"
  resources :jobs, only: [:new, :show, :index]
   
  get "/jobs", to: "jobs#index"
  resources :resumes, only: [:new, :create, :show]

  get "/contact", to: "home#contact"
  get "/about", to: "home#about"
  get "/faq", to: "home#faq"

  resources :businesses, only: [:new, :create]

  namespace "business_admin" do
    get "/", to: "businesses#show"
    resources :jobs, except: [:index, :show]
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
    resources :tags, only: [:new, :create, :destroy]
  end

  get "/:slug", as: :business, to: "businesses#show"
end
