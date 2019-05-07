class MovieController < ApplicationController
  def index

  end

  def show

  end

  def search

    if params[:search1] and params[:search2]
      case params[:search1]

      end
    elsif params[:search]
      case params[:search]
        #Movie title

        #Director

        #Text search on title or keywords

        #Dual actor search TODO make more dynamic for other options (director etc)
      end
    end

  end
end
