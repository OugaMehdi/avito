Rails.application.routes.draw do
  root 'pages#home'

  get 'login' => 'pages#login'
  get 'register' => 'pages#register'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
