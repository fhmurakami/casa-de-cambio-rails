Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  get '/transactions/new', to: 'transactions#new'
  get '/transactions/:id', to: 'transactions#show'
  resources :transactions
  post '/transactions/new'
  patch '/transactions/:id/edit', to: 'transactions#update'
end
