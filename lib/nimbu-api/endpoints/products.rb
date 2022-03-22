# encoding: utf-8
# frozen_string_literal: true

module Nimbu
  module Endpoints
    class Products < Endpoint
      def list(*args, &block)
        arguments(args)

        response = get_request("/products", arguments.params)
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

      def get(*args)
        arguments(args, required: [:product_id])

        get_request("/products/#{product_id}", arguments.params)
      end
      alias_method :find, :get

      def count(*args)
        arguments(args)

        get_request("/products/count", arguments.params)
      end

      def create(*args)
        arguments(args)

        post_request("/products", arguments.params, with_attachments: true)
      end

      def update(*args)
        arguments(args, required: [:product_id])

        patch_request("/products/#{product_id}", arguments.params, with_attachments: true)
      end
      alias_method :edit, :update

      def delete(*args)
        arguments(args, required: [:product_id])

        delete_request("/products/#{product_id}", arguments.params)
      end
      alias_method :remove, :delete
    end # Products
  end # Endpoints
end # Nimbu
