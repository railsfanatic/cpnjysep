Cpnjysep::Application.routes.draw do
  resources :articles

  get "ig/auth", as: :ig_auth
  get "ig/callback", as: :ig_callback
  resources :activities
  get "home/about", as: :about
  root "home#index"
end
