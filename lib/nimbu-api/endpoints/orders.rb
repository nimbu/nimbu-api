# encoding: utf-8

module Nimbu
  module Endpoints
    class Orders < Endpoint
      def list(*args)
        arguments(args)

        response = get_request("/orders", arguments.params)
        return response unless block_given?
        response.each { |el| yield el }
      end
      alias :all :list

      def get(*args)
        arguments(args, :required => [:order_id])

        get_request("/orders/#{order_id}", arguments.params)
      end
      alias :find :get

      def count(*args)
        arguments(args)

        get_request("/orders/count", arguments.params)
      end

    end # Orders
  end # Endpoints
end # Nimbu
