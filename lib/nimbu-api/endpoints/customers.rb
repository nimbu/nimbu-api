# encoding: utf-8

module Nimbu
  module Endpoints
    class Customers < Endpoint
      def list(*args)
        arguments(args)

        response = get_request("/customers", arguments.params)
        return response unless block_given?
        response.each { |el| yield el }
      end
      alias :all :list

      def get(*args)
        arguments(args, :required => [:customer_id])

        get_request("/customers/#{customer_id}", arguments.params)
      end
      alias :find :get

      def create(*args)
        arguments(args)

        post_request("/customers", arguments.params)
      end

      def update(*args)
        arguments(args, :required => [:customer_id])

        patch_request("/customers/#{customer_id}", arguments.params)
      end
      alias :edit :update

      def delete(*args)
        arguments(args, :required => [:customer_id])

        delete_request("/customers/#{customer_id}", arguments.params)
      end
      alias :remove :delete

    end # Customers
  end # Endpoints
end # Nimbu
