# encoding: utf-8
# frozen_string_literal: true

module Nimbu
  module Endpoints
    class Users < Endpoint
      def me(*args)
        require_authentication

        get_request("/user")
      end
      alias_method :whoami, :me

      private

      def require_authentication
        raise ArgumentError, "You need to be authenticated to access the sites" unless authenticated?
      end
    end # Authorizations
  end # Endpoints
end # Nimbu
