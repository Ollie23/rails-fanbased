Rails.application.routes.draw do

  get "teams/:id/fans", to: "fans#create"
  get "events", to: "events#create"

  devise_for :users, :controllers => { registrations: "registrations"}
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :profiles

  resources :games

  resources :teams, only: [:show, :create, :new, :edit, :update, :destroy]

  resources :teams do
    resources :fans, only: [:create]
  end

  resources :leagues

  resources :events, only: [:create]

  resources :venues do
    resources :events
  end


end
