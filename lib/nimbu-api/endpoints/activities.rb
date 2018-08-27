# encoding: utf-8

module Nimbu
  module Endpoints
    class Activities < Endpoint

      def get(*args)
        arguments(args, :required => [:activity_id])

        get_request("/activities/#{activity_id}", arguments.params)
      end
      alias :find :get

    end # Authorizations
  end # Endpoints
end # Nimbu
