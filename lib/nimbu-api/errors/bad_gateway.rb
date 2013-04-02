# encoding: utf-8

module Nimbu #:nodoc
  # Raised when Nimbu returns the HTTP status code 502 (which 'should' never happen)
  module Error
    class BadGateway < ServiceError
      http_status_code 502

      def initialize(response)
        super(response)
      end

    end # BadGateway
  end # Error
end # Nimbu
