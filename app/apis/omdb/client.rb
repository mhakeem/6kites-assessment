# frozen_string_literal: true

# NOTE: This code is heavily influenced by https://www.nopio.com/blog/how-to-create-an-api-wrapper-of-an-external-service-in-rails/#:~:text=Your%20API%20wrappers%20should%20be%20kept%20in%20the,creating%20a%20github_api%20folder%20in%20the%20apis%20folder.

module Omdb
  module HttpStatusCodes
    OK = 200
    BAD_REQUEST = 400
    UNAUTHORIZED = 401
    FORBIDDEN = 403
    NOT_FOUND = 404
    UNPROCESSABLE_ENTITY = 429
  end

  module ApiExceptions
    class APIExceptionError < StandardError; end
    class BadRequestError < StandardError; end
    class UnauthorizedError < StandardError; end
    class ForbiddenError < StandardError; end
    class ApiRequestsQuotaReachedError < StandardError; end
    class NotFoundError < StandardError; end
    class UnprocessableEntityError < StandardError; end
    class ApiError < StandardError; end
  end

  module HttpStatusErrors
    private

    def error_class(status)
      case status
      when BAD_REQUEST
        BadRequestError
      when UNAUTHORIZED
        UnauthorizedError
      when FORBIDDEN
        ForbiddenError
      when NOT_FOUND
        NotFoundError
      when UNPROCESSABLE_ENTITY
        UnprocessableEntityError
      else
        ApiError
      end
    end
  end

  class Client
    include HttpStatusCodes
    include ApiExceptions
    include HttpStatusErrors

    def initialize(base_url)
      @base_url = base_url
      @default_params = {
        query: {
          apikey: ENV.fetch('OMDB_API_KEY'),
          type: 'movie'
        }
      }
    end

    def get(query_params)
      request(:get, query_params)
    end

    private

    def request(http_method, query_params)
      response = client(http_method, query_params)
      return response.parsed_response if response_successful?(response.code)

      raise error_class, "Code: #{response.code}, response: #{response.body}"
    end

    def client(http_method, query_params)
      query_params.deep_merge!(@default_params)
      HTTParty.public_send(http_method, @base_url, query_params)
    end

    def response_successful?(status)
      status == OK
    end
  end
end
