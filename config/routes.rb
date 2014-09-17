Rails.application.routes.draw do

  root :to => "questions#index"

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :questions do
    resources :answers do
      resources :votes
    end
  end

  resources :searches
  resources :users
  resources :sessions
end
