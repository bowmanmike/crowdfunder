Rails.application.routes.draw do

  root 'users#index'

  resources :projects do
    resources :rewards, :pledges
  end

  resources :users
  resources :sessions

  get 'login'   => 'sessions#new',    :as => :login
  post 'logout' => 'sessions#destroy',:as => :logout
end
