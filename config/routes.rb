Rails.application.routes.draw do
  devise_for :users
  get 'about-me', to: 'pages#about'
  get 'contact',  to: 'pages#about'
  resources :blogs do
    member do
      get :toggle_status
    end
  end
  resources :portfolios, except: [:show]
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  get 'angular', to: 'portfolios#angular', as: 'angular'
  root 'pages#home'
end
