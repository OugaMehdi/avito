Rails.application.routes.draw do
  resources :favoris
  resources :sous_categories
  resources :categories
  resources :commandes
  resources :villes
  resources :utilisateurs
  resources :annonces
  get 'utilisateurs/new'
  get 'villes/new'
  root 'pages#home'

  get 'login' => 'pages#login'
  get 'register' => 'pages#register'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
