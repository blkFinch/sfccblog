Rails.application.routes.draw do
  get '/', to: "static_pages#home"

  resources :users
end
