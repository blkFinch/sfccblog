Rails.application.routes.draw do
  get '/', to: "static_pages#home"

  get    '/login',   to: 'static_pages#home'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users
  
  resources :articles do 
    resources :comments
  end

  root "static_pages#home"
end
