# encoding: utf-8

module Nimbu
  module Error
    # Raised when Nimbu returns the HTTP status code 400
    class BadRequest < ServiceError
      http_status_code 400

      def initialize(response)
        super(response)
      end
    end
  end
end # Nimbu
