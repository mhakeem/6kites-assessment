class Movie
  API_KEY  = ENV['OMDB_API_KEY']
  BASE_URL = "http://www.omdbapi.com/?apikey=#{API_KEY}&type=movie"

  def initialize
    
  end

  def self.get(movie_id)
    results = HTTParty.get(BASE_URL + "&i=#{movie_id}")
    parsed = results.parsed_response
    parsed
  end

  def self.search(term, page=1)
    results = HTTParty.get(BASE_URL + "&s=#{term}&page=#{page}")
    parsed = results.parsed_response
    parsed['Search']
  end

end