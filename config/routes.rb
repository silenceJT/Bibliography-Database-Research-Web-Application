Rails.application.routes.draw do
  
  # resources :users, only: [:new, :create]
  # get 'login', to: 'sessions#new'
  # post 'login', to: 'sessions#create'
  # get 'welcome', to: 'sessions#welcome'
  # get 'authorized', to: 'sessions#page_requires_login'
  #root 'sessions#welcome'

  resources :bibs
  root 'static_pages#home'
  get  '/home',    to: 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact',   to: 'static_pages#contact'
end
