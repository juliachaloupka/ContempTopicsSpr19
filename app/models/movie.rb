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


  def self.search_title(search)
    if search
      self.find({:movie_title => search}).limit(10)
    end
  end

  def self.search_director(search)
    if search
      self.find({:director => search}).limit(10)
    end
  end

  def self.text_search(search)
    if search
      self.({'$text' => {'$search' => search, '$caseSensitive' => false}}).limit(10)
    end
  end

  def self.search_two_actors(search1, search2)
    if search1 and search2
      self.find({'actor_1_name' => search1, 'actor_2_name' => search2}).limit(10)
    end
  end


end


