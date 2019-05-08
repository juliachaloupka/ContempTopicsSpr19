Rails.application.routes.draw do

  resources :movies
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
  post 'movies/search_db'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
