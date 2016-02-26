Rails.application.routes.draw do

  root 'projects#index'

  resources :projects do
    resources :rewards, :pledges
  end

  resources :tags
  resources :users
  resources :sessions
  resources :comments

  get 'login'   => 'sessions#new',    :as => :login
  post 'logout' => 'sessions#destroy',:as => :logout
end
