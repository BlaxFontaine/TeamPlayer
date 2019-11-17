Rails.application.routes.draw do
  devise_for :leagues

  devise_scope :league do
    get 'sign_in', to: 'devise/sessions#new'
  end

  root to: 'leagues#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :teams
  resources :players

  get 'dashboard', to: 'leagues#show'

  namespace :admin do
    resources :leagues, only: [:index]
  end
end
