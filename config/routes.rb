Rails.application.routes.draw do

  get 'movies/search_db' => 'movies#search_db', as: 'search_db'
  resources :movies
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
