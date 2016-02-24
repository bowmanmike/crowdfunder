Rails.application.routes.draw do
  root 'projects#index'

  resources :projects do
    resources :rewards, :pledges
  end

  resources :users
  resources :sessions, only: [:new, :create, :destroy]

end
