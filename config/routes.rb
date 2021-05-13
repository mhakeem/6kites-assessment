Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "movies#search"

  get '/validate', to: 'application#validate'
  get '/search', to: 'movies#search'
  post '/search', to: 'movies#search'
  get '/movie/:id', to: 'movies#movie', as: 'movie'

  resources :notes, only: [:new, :create, :edit, :update]
end
