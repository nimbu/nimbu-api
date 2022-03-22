# encoding: utf-8
# frozen_string_literal: true

module Nimbu
  module Endpoints
    class Simulator < Endpoint
      def recipe(*args)
        arguments(args)

        response = post_request("/simulator/recipe", arguments.params)
        response
      end

      def render(*args)
        arguments(args)

        response = post_request("/simulator/render", arguments.params)
        response
      end
    end # Simulator
  end # Endpoints
end # Nimbu
