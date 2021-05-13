class MoviesController < ApplicationController

  skip_before_action :verify_authenticity_token

  def movie
    @movie_id = params[:id]
    @movie = Movie.get(@movie_id)
    @note = Note.find_by(movie_id: @movie_id)
    
  end

  def search
    @term = params[:term]

    unless (@term.blank?)
      @movies = Movie.search(@term)
    else
      @movies = []
    end
  end

end
