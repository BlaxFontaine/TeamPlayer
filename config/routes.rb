Rails.application.routes.draw do
  devise_for :leagues

  get "league_root" => "dashboards#show"
  devise_scope :league do
    root to: 'devise/sessions#new'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :leagues, except: [:index] do
    resources :teams
  end
  resources :teams do
    resources :players
  end

  namespace :admin do
    resources :leagues, only: [:index]
  end

  get '/dashboard', to: 'dashboards#show'
end
