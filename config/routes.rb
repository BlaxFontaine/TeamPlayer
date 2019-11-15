Rails.application.routes.draw do
  devise_for :leagues

  get "league_root" => "leagues#show"
  devise_scope :league do
    root to: 'devise/sessions#new'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :leagues, except: [:index] do
    resources :teams
    resources :players
  end

  namespace :admin do
    resources :leagues, only: [:index]
  end
end
