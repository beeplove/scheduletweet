Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [] do
    resources :tweets
  end

  match 'auth/twitter/callback', to: 'sessions#create', via: [:get]

end
