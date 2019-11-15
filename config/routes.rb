Rails.application.routes.draw do
  devise_for :leagues

  get "league_root" => "dashboards#show"
  devise_scope :league do
    root to: 'devise/sessions#new'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get '/dashboard', to: 'dashboard#league', as: 'dashboard'
  # resources :dashboards, only: [:show] do
  #   resources :teams
  # end

  namespace :dashboard do
    resources :teams, :players
  end

  # resources :teams do
  #   resources :players
  # end

  get '/dashboard', to: 'dashboards#show'
end
