# encoding: utf-8

module Nimbu
  module Endpoints
    class Simulator < Endpoint

      def recipe(*args)
        arguments(args)

        response = post_request("/simulator/recipe", arguments.params)
        return response
      end

      def render(*args)
        arguments(args)

        response = post_request("/simulator/render", arguments.params)
        return response
      end

    end # Simulator
  end # Endpoints
end # Nimbu
