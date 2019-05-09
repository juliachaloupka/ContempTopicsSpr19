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
  field :reco, type: String

  search_in :genres


  def self.search_title(search)
    if search
      self.where({:movie_title => /.*#{search}.*/i}).limit(50)
    end
  end

  def self.search_director(search)
    if search
      self.where({:director_name => /.*#{search}.*/i}).limit(50)
    end
  end

  def self.text_search(search)
    if search
      self.where({'$text' => {'$search' => search, '$caseSensitive' => false}}).limit(50)
    end
  end

  def self.search_two_actors(search1, search2)
    if not search1.blank? and search2.blank?
      self.where({'actor_1_name' => /.*#{search1}.*/i}).limit(10) +
          self.where({'actor_2_name' => /.*#{search1}.*/i}).limit(10) + self.where({'actor_3_name' => /.*#{search1}.*/i}).limit(10)
    elsif not search1.blank? and not search2.blank?
      self.where({'actor_1_name' => /.*#{search1}.*/i, 'actor_2_name' => /.*#{search2}.*/i}).limit(10) +
          self.where({'actor_2_name' => /.*#{search1}.*/i, 'actor_1_name' => /.*#{search2}.*/i}).limit(10) +
          self.where({'actor_2_name' => /.*#{search1}.*/i, 'actor_3_name' => /.*#{search2}.*/i}).limit(10) +
          self.where({'actor_1_name' => /.*#{search1}.*/i, 'actor_3_name' => /.*#{search2}.*/i}).limit(10) +
          self.where({'actor_3_name' => /.*#{search1}.*/i, 'actor_2_name' => /.*#{search2}.*/i}).limit(10) +
          self.where({'actor_3_name' => /.*#{search1}.*/i, 'actor_1_name' => /.*#{search2}.*/i}).limit(10)

    elsif search1.blank? and not search2.blank?
      self.where({'actor_1_name' => /.*#{search2}.*/i}).limit(20) +
          self.where({'actor_2_name' => /.*#{search2}.*/i}).limit(20) + self.where({'actor_3_name' => /.*#{search2}.*/i}).limit(20)
    end
  end


end


