class Movie
  BASE_URL = "http://www.omdbapi.com"
  
  @@pages = 0

  def self.get(movie_id)
    options = query_options.deep_merge({query: {i: movie_id}})
    results = HTTParty.get(BASE_URL, options)
    movie = results.parsed_response
    
    add_imdb_url(movie)
    fix_no_movie_poster(movie)
    movie
  end

  def self.search(term, page=1)
    options = query_options.deep_merge({query: {s: term, page: page}})
    results = HTTParty.get(BASE_URL, options)
    parsed = results.parsed_response
    movies = parsed['Search']

    fix_no_movies_poster(movies)
    total_pages(parsed['totalResults'])
    movies
  end

  def self.pages
    @@pages
  end

  def self.total_results
    @@total_results
  end

  def self.total_pages(total_results)
    @@total_results = total_results
    @@pages = (total_results.to_i/10.0).ceil
  end

  private
  def self.query_options
    apikey  = ENV['OMDB_API_KEY']
    {query: {apikey: apikey, type: 'movie'}}
  end

  def self.fix_no_movies_poster(movies)
    movies.each do |m|
      fix_no_movie_poster(m)
    end
  end

  def self.fix_no_movie_poster(movie)
    if movie['Poster'] == 'N/A'
      movie['Poster'] = "https://via.placeholder.com/400?text=No+Image"
    end
  end

  def self.add_imdb_url(movie)
    movie['imdbURL'] = "https://www.imdb.com/title/#{movie['imdbID']}"
  end

end