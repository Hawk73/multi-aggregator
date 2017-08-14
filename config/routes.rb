Rails.application.routes.draw do
  resources :providers
  devise_for :users, path: 'auth', controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  root 'home#index'

  resources :providers
  resources :requests
end
