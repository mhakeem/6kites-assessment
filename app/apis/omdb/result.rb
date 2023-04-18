# frozen_string_literal: true

module Omdb
  class Result
    PER_PAGE = 10

    attr_reader :total_results, :results

    def initialize(result)
      @total_results = result['totalResults'].to_i
      @results = build_movies_results(result['Search'])
    end

    def total_pages
      (total_results / PER_PAGE.to_f).ceil
    end

    private

    def build_movies_results(movies)
      return [] if movies.nil?

      movies.map { |movie| Omdb::Movie.new(movie) }
    end
  end
end
