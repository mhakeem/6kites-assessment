class MoviesController < ApplicationController

  skip_before_action :verify_authenticity_token

  def movie

    @movie_id = params[:id]

    @movie = {}

    key = ENV['OMDB_API_KEY']

    results = HTTParty.get("http://www.omdbapi.com/?apikey=#{key}&i=#{@movie_id}&type=movie")

    parsed = results.parsed_response

    @movie = parsed

  end

  def search

    @term = params[:term]

    if (@term)

      key = ENV['OMDB_API_KEY']

      results = HTTParty.get("http://www.omdbapi.com/?apikey=#{key}&s=#{@term}&type=movie")

      parsed = results.parsed_response

      @movies = parsed['Search']

    else

      @movies = []

    end

  end

end
