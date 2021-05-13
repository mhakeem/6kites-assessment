class Movie
  BASE_URL = "http://www.omdbapi.com"
  
  @@pages = 0


  def self.get(movie_id)
    options = query_options.deep_merge({query: {i: movie_id}})
    results = HTTParty.get(BASE_URL, options)
    movie = results.parsed_response
    movie['imdbURL'] = "https://www.imdb.com/title/#{movie['imdbID']}"
    if movie['Poster'] == 'N/A'
      movie['Poster'] = "https://via.placeholder.com/400?text=No+Image"
    end
    movie
  end

  def self.search(term, page=1)
    # options = query_options.deep_merge({query: {s: term, page: page}})
    # results = HTTParty.get(BASE_URL, options)
    # parsed = results.parsed_response
    
    file = File.read "/home/mhakeem/Documents/omdbapi-1620712801522.json"
    parsed = JSON.parse file

    movies = parsed['Search']
    movies.each do |m|
      if m['Poster'] == 'N/A'
        m['Poster'] = "https://via.placeholder.com/400?text=No+Image"
      end
    end
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

end