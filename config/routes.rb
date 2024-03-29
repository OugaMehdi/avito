Rails.application.routes.draw do
  resources :favoris
  resources :sous_categories
  resources :categories
  resources :commandes
  resources :villes
  resources :utilisateurs
  resources :annonces

  get 'villes/new'
  root 'pages#home'
  get 'register' => 'utilisateurs#new'
  get '/reglage', to: 'utilisateurs#edit', as: 'reglage'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  patch 'editInfo' => 'utilisateurs#update_info'

  patch 'editPassword' => 'utilisateurs#update_password'

  get '/annonces' => 'annonces#new'


  get 'annonce' => 'annonces#show' 

  get '/search', to:'pages#home'
  post '/search', to:'pages#home'

  get '/mesannonces', to:'annonces#show'

  get '/myannonces', to:'annonces#myannonces'

  post 'mescommandes' => 'commandes#create'


  post 'mescommandes' => 'commandes#create'
  get 'mescommandes' => 'commandes#show'

  get 'mesfavoris' => 'favoris#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
