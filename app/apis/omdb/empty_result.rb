module Omdb
  class EmptyResult < Omdb::Result
    def initialize
      super({})
    end
  end
end
