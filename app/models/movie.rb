class Movie
  def self.get(movie_id)
    Omdb::Api.movie(movie_id)
  end

  def self.search(term, page = 1)
    Omdb::Api.search(term, page)
  end
end
