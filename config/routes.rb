Rails.application.routes.draw do
  devise_for :leagues

  get "league_root" => "league#show"
  devise_scope :league do
    root to: 'devise/sessions#new'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :leagues do
    resources :teams, only: [:index, :new, :create]
  end
  resources :players
  resources :teams, only: [:show, :edit, :update, :destroy]

  namespace :admin do
    resources :leagues, only: [:index]
  end
end
