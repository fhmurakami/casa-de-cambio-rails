Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  get '/transactions/new', to: 'transactions#new'
  get '/transactions/:id', to: 'transactions#show'
  get '/users/new', to: 'users#new'
  get '/users/:id', to: 'users#show'
  resources :users
  resources :transactions
  post '/transactions/new'
  patch '/transactions/:id/edit', to: 'transactions#update'
  post '/users/new'
  post '/users/:id/edit', to: 'users#update'
end
