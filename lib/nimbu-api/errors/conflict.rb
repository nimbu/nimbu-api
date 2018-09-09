# encoding: utf-8

module Nimbu #:nodoc
  # Raised when Nimbu returns the HTTP status code 409
  module Error
    class Conflict < ServiceError
      http_status_code 409

      def initialize(response)
        super(response)
      end

    end # NotAcceptable
  end # Error
end # Nimbu
