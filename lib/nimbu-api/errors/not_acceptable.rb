# encoding: utf-8

module Nimbu #:nodoc
  # Raised when Nimbu returns the HTTP status code 406
  module Error
    class NotAcceptable < ServiceError
      http_status_code 406

      def initialize(response)
        super(response)
      end

    end # NotAcceptable
  end # Error
end # Nimbu
