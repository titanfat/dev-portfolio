Rails.application.routes.draw do
  get 'about',   to: 'pages#about'
  get 'contact', to: 'pages#about'
  resources :blogs
  resources :portfolios
  root 'pages#home'
end
