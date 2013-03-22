# encoding: utf-8

module Nimbu #:nodoc
  # Raised when Nimbu returns the HTTP status code 404
  module Error
    class NotFound < ServiceError
      http_status_code 404

      def initialize(env)
        super(env)
      end
    end
  end # Error
end # Nimbu
