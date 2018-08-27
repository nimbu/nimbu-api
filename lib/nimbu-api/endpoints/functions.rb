# encoding: utf-8

module Nimbu
  module Endpoints
    class Functions < Endpoint

      def run(*args)
        arguments(args, :required => [:function_id])

        post_request("/functions/#{function_id}", arguments.params)
        return response
      end

    end # Simulator
  end # Endpoints
end # Nimbu
