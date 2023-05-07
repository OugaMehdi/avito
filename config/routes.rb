Rails.application.routes.draw do
  resources :favoris
  resources :sous_categories
  resources :categories
  resources :commandes
  resources :villes
  resources :utilisateurs
  resources :annonces, only: [:create , :destroy]

  get 'villes/new'
  root 'pages#home'
  get 'register' => 'utilisateurs#new'
  get '/reglage', to: 'utilisateurs#edit', as: 'reglage'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  patch 'editInfo' => 'utilisateurs#update_info'

  patch 'editPassword' => 'utilisateurs#update_password'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
