# encoding: utf-8

module Nimbu
  module Endpoints
    class Sites < Endpoint

      def list(*args)
        require_authentication
        arguments(args)

        response = get_request("/sites", arguments.params)
        return response unless block_given?
        response.each { |el| yield el }
      end
      alias :all :list

      def get(*args)
        require_authentication
        arguments(args, :required => [:site_id])

        get_request("/authorizations/#{site_id}", arguments.params)
      end
      alias :find :get


      private

      def require_authentication
        raise ArgumentError, 'You need to be authentication to access the sites' unless authenticated?
      end

    end # Authorizations
  end # Endpoints
end # Nimbu
