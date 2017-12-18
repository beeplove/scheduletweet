Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # TODO: add production with authentication
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  resources :users, only: [] do
    resources :tweets
  end

  match 'auth/twitter/callback', to: 'sessions#create', via: [:get]
  match 'signout', to: 'sessions#destroy', via: [:delete]

  root to: "home#index"
end
