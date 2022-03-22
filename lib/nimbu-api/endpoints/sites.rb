# encoding: utf-8
# frozen_string_literal: true

module Nimbu
  module Endpoints
    class Sites < Endpoint
      def list(*args, &block)
        require_authentication
        arguments(args)

        response = get_request("/sites", arguments.params)
        return response unless block_given?
        response.each(&block)
      end
      alias_method :all, :list

      def get(*args)
        require_authentication
        arguments(args, required: [:site_id])

        get_request("/sites/#{site_id}", arguments.params)
      end
      alias_method :find, :get

      private

      def require_authentication
        raise ArgumentError, "You need to be authenticated to access the sites" unless authenticated?
      end
    end # Authorizations
  end # Endpoints
end # Nimbu
