# frozen_string_literal: true

module Omdb
  class Movie
    attr_reader :title, :year, :imdb_id, :type, :poster, :imdb_url, :genre, :director, :actors, :rated

    def initialize(movie)
      @title = movie['Title']
      @year = movie['Year']
      @imdb_id = movie['imdbID']
      @type = movie['Type']
      @poster = fix_no_movie_poster(movie['Poster'])
      @imdb_url = "https://www.imdb.com/title/#{@imdb_id}"
      @genre = movie['Genre']
      @director = movie['Director']
      @actors = movie['Actors'] || []
      @rated = movie['Rated']
    end

    private

    def fix_no_movie_poster(poster)
      placeholder = 'https://via.placeholder.com/400?text=No+Image'

      poster == 'N/A' ? placeholder : poster
    end
  end
end
