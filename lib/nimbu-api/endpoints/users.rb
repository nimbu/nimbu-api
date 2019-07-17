# encoding: utf-8

module Nimbu
  module Endpoints
    class Users < Endpoint

      def me(*args)
        require_authentication

        get_request("/user")
      end
      alias :whoami :me

      private

      def require_authentication
        raise ArgumentError, 'You need to be authenticated to access the sites' unless authenticated?
      end

    end # Authorizations
  end # Endpoints
end # Nimbu
