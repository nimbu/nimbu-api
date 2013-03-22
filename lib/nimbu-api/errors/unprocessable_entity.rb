# encoding: utf-8

module Nimbu #:nodoc
  # Raised when Nimbu returns the HTTP status code 422
  module Error
    class UnprocessableEntity < ServiceError
      http_status_code 422

      def initialize(response)
        super(response)
      end
    end
  end # Error
end # Nimbu
