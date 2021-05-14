class MoviesController < ApplicationController

  before_action :verify_authenticity_token

  def movie
    @movie_id = params[:id]
    @movie = Movie.get(@movie_id)
    @note = Note.find_by(movie_id: @movie_id)
    @fav = Favorite.find_by(movie_id: @movie_id)
  end

  def search
    @term = params[:term]
    @page = params[:page] || 1

    unless (@term.blank?)
      @movies = Movie.search(@term, @page)
      @total_pages = Movie.pages
      @total_results = Movie.total_results
    else
      @movies = []
    end
  end

end
