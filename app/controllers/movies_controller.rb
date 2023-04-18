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
    @page = (params[:page] || 1).to_i

    search = Movie.search(@term, @page)
    @movies = search.results
    @total_pages = search.total_pages
    @total_results = search.total_results
    @pagy = Pagy.new(count: @total_results, page: @page, items: Omdb::Result::PER_PAGE, params: { term: @term })
  end
end
