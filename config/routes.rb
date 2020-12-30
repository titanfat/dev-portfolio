Rails.application.routes.draw do
  resources :comments
  resources :topics, only: %w[index show]
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  get 'about-me', to: 'pages#about'
  get 'contact',  to: 'pages#contact'
  resources :blogs do
    member do
      get :toggle_status
    end
  end
  resources :portfolios, except: [:show] do
    put :sort, on: :collection
  end
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  get 'angular', to: 'portfolios#angular', as: 'angular'
  mount ActionCable.server => '/cable'
  root 'pages#home'
end
