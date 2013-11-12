Cpnjysep::Application.routes.draw do
  devise_for :users
  resources :articles

  get "ig/auth", as: :ig_auth
  get "ig/callback", as: :ig_callback
  resources :activities
  get "home/about", as: :about
  root "home#index"
  
  get "/auth/:provider/callback", to: "sessions#create"
end
