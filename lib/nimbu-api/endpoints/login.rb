# encoding: utf-8
# frozen_string_literal: true

module Nimbu
  module Endpoints
    class Login < Endpoint
      def initialize(options = {}, &block)
        super

        require_authentication

        # fetch api token
        @response = post_request("/auth/login")
      end

      attr_reader :response

      def require_authentication
        raise ArgumentError, "A username and password is required in order to login" unless authenticated?
      end
    end # Authorizations
  end # Endpoints
end # Nimbu
