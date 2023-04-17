# frozen_string_literal: true

module Omdb
  class Api
    class << self
      BASE_URL = 'http://www.omdbapi.com'

      def movie(imdb_id)
        query = { query: { i: imdb_id } }
        result = client.get(query)
        # result = JSON.parse(File.read('data/movie.json'))
        Movie.new(result)
      end

      def search(term, page = 1)
        query = { query: { s: term, page: page } }
        result = client.get(query)
        # result = JSON.parse(File.read('data/search.json'))
        Result.new(page, result)
      end

      def client
        @client ||= Client.new(BASE_URL)
      end
    end
  end
end
