# encoding: utf-8
# frozen_string_literal: true

module Nimbu
  module Endpoints
    class Customers < Endpoint
      def list(*args, &block)
        arguments(args)

        response = get_request("/customers", arguments.params)
        return response unless block_given?
        response.each(&block)
      end
      alias_method :all, :list

      def customizations(*args, &block)
        arguments(args)

        response = get_request("/products/customizations", arguments.params)
        return response unless block_given?
        response.each(&block)
      end
      alias_method :fields, :customizations
      alias_method :custom_fields, :customizations

      def count(*args)
        arguments(args)

        get_request("/customers/count", arguments.params)
      end

      def get(*args)
        arguments(args, required: [:customer_id])

        get_request("/customers/#{customer_id}", arguments.params)
      end
      alias_method :find, :get

      def create(*args)
        arguments(args)

        post_request("/customers", arguments.params)
      end

      def update(*args)
        arguments(args, required: [:customer_id])

        patch_request("/customers/#{customer_id}", arguments.params)
      end
      alias_method :edit, :update

      def delete(*args)
        arguments(args, required: [:customer_id])

        delete_request("/customers/#{customer_id}", arguments.params)
      end
      alias_method :remove, :delete
    end # Customers
  end # Endpoints
end # Nimbu
