Rails.application.routes.draw do
  get '/', to: "static_pages#home"

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users
  resources :articles

  root "static_pages#home"
end
