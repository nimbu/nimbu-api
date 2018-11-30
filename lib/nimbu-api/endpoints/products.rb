# encoding: utf-8

module Nimbu
  module Endpoints
    class Products < Endpoint
      def list(*args)
        arguments(args)

        response = get_request("/products", arguments.params)
        return response unless block_given?
        response.each { |el| yield el }
      end
      alias :all :list

      def customizations(*args)
        arguments(args)

        response = get_request("/products/customizations", arguments.params)
        return response unless block_given?
        response.each { |el| yield el }
      end
      alias :fields :customizations
      alias :custom_fields :customizations

      def get(*args)
        arguments(args, :required => [:product_id])

        get_request("/products/#{product_id}", arguments.params)
      end
      alias :find :get

      def count(*args)
        arguments(args)

        get_request("/products/count", arguments.params)
      end

      def create(*args)
        arguments(args)

        post_request("/products", arguments.params)
      end

      def update(*args)
        arguments(args, :required => [:product_id])

        patch_request("/products/#{product_id}", arguments.params)
      end
      alias :edit :update

      def delete(*args)
        arguments(args, :required => [:product_id])

        delete_request("/products/#{product_id}", arguments.params)
      end
      alias :remove :delete

    end # Products
  end # Endpoints
end # Nimbu
