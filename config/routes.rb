Rails.application.routes.draw do
  root to: 'pages#home'
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
