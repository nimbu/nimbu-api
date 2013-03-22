# encoding: utf-8

module Nimbu #:nodoc
  # Raised when Nimbu returns the HTTP status code 503
  module Error
    class ServiceUnavailable < ServiceError
      http_status_code 503

      def initialize(response)
        super(response)
      end

    end # ServiceUnavailable
  end # Error
end # Nimbu
