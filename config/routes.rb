Rails.application.routes.draw do
  resources :users 
  resources :bets
  resources :lines
  post '/login', to: 'sessions#create'
  get '/users/:id/past_bets', to: 'users#past_bets'
  get '/users/:id/pending_bets', to: 'users#pending_bets'
  get '/bets/:id/lines', to: 'bets#lines'
  get '/lines/specific_team/:team', to: 'lines#matchup_lines'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
