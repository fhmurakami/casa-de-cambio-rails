Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  get '/transactions/new', to: 'transactions#new'
  get '/transactions/:id', to: 'transactions#show'
  get '/users/new', to: 'users#new'
  get '/users/:id', to: 'users#show'
  get '/addresses/new', to: 'addresses#new'
  get '/addresses/:id', to: 'addresses#show'
  resources :users
  resources :transactions
  resources :addresses
  post '/transactions/new'
  patch '/transactions/:id/edit', to: 'transactions#update'
  post '/users/new'
  patch '/users/:id/edit', to: 'users#update'
  post '/addresses/new'
  patch '/addresses/:id/edit', to: 'addresses#update'
end
