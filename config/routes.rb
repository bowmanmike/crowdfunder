Rails.application.routes.draw do

  root 'projects#index'

  resources :projects do
    resources :rewards, :pledges
    resources :comments, only [:show, :create, :destroy]
  end

  resources :tags
  resources :users
  resources :sessions


  get 'login'   => 'sessions#new',    :as => :login
  post 'logout' => 'sessions#destroy',:as => :logout
end
