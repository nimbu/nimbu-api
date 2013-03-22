# encoding: utf-8

module Nimbu #:nodoc
  # Raised when Nimbu returns the HTTP status code 500
  module Error
    class InternalServerError < ServiceError
      http_status_code 500

      def initialize(response)
        super(response)
      end

    end # InternalServerError
  end # Error
end # Nimbu
