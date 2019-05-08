class MoviesController < ApplicationController

  def movie_params
  end

  def show
    id = params[:id] # retrieve movies ID from URI route
    @movie = Movie.find(id) # look up movies by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @movies = Movie.all
    # will render app/views/movies/show.<extension> by default
  end

  def new
    # default: render 'new' template
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy

  end

  def search_db
    if params[:search1] and params[:search2]
=begin
      case params[:search1]

      end
=end
    elsif params[:search]
=begin
      case params[:search]
        #Movie title

        #Director

        #Text search on title or keywords

        #Dual actor search TODO make more dynamic for other options (director etc)
      end
=end

    end
  end


end
