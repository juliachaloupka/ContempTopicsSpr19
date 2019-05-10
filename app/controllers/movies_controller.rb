class MoviesController < ApplicationController

  def movie_params
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @movies = Movie.all

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
    session[:search_results] = request.url
    #puts params[:search_terms]
    if(params[:search_terms].blank?)
      flash[:notice] = "Invalid search term"
      redirect_to movies_path
    else
      if params[:search_cat] == 'Title/Keyword'
        @movies=Movie.text_search(params[:search_terms])
        @search_terms=params[:search_terms]
      end

      if params[:search_cat] == 'Title only'
        @movies=Movie.search_title(params[:search_terms])
        @search_terms=params[:search_terms]
      end
      if params[:search_cat] == 'Director'
        @movies=Movie.search_director(params[:search_terms])
        @search_terms=params[:search_terms]
      end
      if params[:search_cat] == 'Actor'
        @movies=Movie.search_two_actors(params[:search_terms], params[:search_terms2])
        @search_terms=params[:search_terms]
        @search_terms2 = params[:search_terms2]
        if @search_terms.nil?
          @search_terms = ""
        end
        if @search_terms2.nil?
          @search_terms2 = ""
        end
      end


      if (@movies.count.nil? || @movies.count == 0)
        flash[:notice] = "No matching movies were found in the DB"
        redirect_to movies_path
      end
      end
  end


end
