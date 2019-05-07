class Movie
  include Mongoid::Document
  include Mongoid::Search
  field :movie_title, type: String
  field :director_name, type: String
  field :actor_1_name, type: String
  field :actor_2_name, type: String
  field :actor_3_name, type: String
  field :language, type: String
  field :country, type: String
  field :content_rating, type: String
  field :budget, type: Integer
  field :title_year, type: String
  field :plot_keywords, type: String
  field :genres, type: String
  field :gross, type: Integer
  field :imdb_score, type: Float
  field :movie_imdb_link, type: String

  search_in :genres
end

