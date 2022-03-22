# encoding: utf-8
# frozen_string_literal: true

module Nimbu
  module Endpoints
    class Collections < Endpoint
      def list(*args, &block)
        arguments(args)

        response = get_request("/collections", arguments.params)
        return response unless block_given?
        response.each(&block)
      end
      alias_method :all, :list

      def get(*args)
        arguments(args, required: [:collection_id])

        get_request("/collections/#{collection_id}", arguments.params)
      end
      alias_method :find, :get

      def create(*args)
        arguments(args)

        post_request("/collections", arguments.params)
      end

      def update(*args)
        arguments(args, required: [:collection_id])

        patch_request("/collections/#{collection_id}", arguments.params)
      end
      alias_method :edit, :update

      def delete(*args)
        arguments(args, required: [:collection_id])

        delete_request("/collections/#{collection_id}", arguments.params)
      end
      alias_method :remove, :delete
    end # Products
  end # Endpoints
end # Nimbu
