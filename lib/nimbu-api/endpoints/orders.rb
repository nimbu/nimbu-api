# encoding: utf-8
# frozen_string_literal: true

module Nimbu
  module Endpoints
    class Orders < Endpoint
      def list(*args, &block)
        arguments(args)

        response = get_request("/orders", arguments.params)
        return response unless block_given?
        response.each(&block)
      end
      alias_method :all, :list

      def get(*args)
        arguments(args, required: [:order_id])

        get_request("/orders/#{order_id}", arguments.params)
      end
      alias_method :find, :get

      def count(*args)
        arguments(args)

        get_request("/orders/count", arguments.params)
      end
    end # Orders
  end # Endpoints
end # Nimbu
