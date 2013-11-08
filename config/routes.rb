Cpnjysep::Application.routes.draw do
  get "ig/auth", as: :ig_auth
  get "ig/callback", as: :ig_callback
  resources :activities
  root "activities#index"
end
