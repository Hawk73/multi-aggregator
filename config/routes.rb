Rails.application.routes.draw do
  resources :snippets
  devise_for :users, path: 'auth', controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  root 'home#index'

  resources :snippets do
    member do
      post :add_comment
    end
  end
end
