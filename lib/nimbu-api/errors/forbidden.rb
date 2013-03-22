# encoding: utf-8

module Nimbu #:nodoc
  # Raised when Nimbu returns the HTTP status code 403
  module Error
    class Forbidden < ServiceError
      http_status_code 403

      def initialize(response)
        super(response)
      end
    end
  end # Error
end # Nimbu
