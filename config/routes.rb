Rails.application.routes.draw do
  resources :users
  resources :bets
  resources :lines
  resources :teams
  resources :matches
  resources :leagues
  resources :sports
  post '/login', to: 'sessions#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
