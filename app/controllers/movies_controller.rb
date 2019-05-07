class MoviesController < ApplicationController

  def movie_params
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index

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

  end


end
