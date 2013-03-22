# encoding: utf-8

module Nimbu #:nodoc
  # Raised when Nimbu returns the HTTP status code 401
  module Error
    class Unauthorized < ServiceError
      http_status_code 401

      def initialize(response)
        super(response)
      end

    end # Unauthorized
  end # Error
end # Nimbu
