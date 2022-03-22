# encoding: utf-8
# frozen_string_literal: true

module Nimbu
  module Endpoints
    class Uploads < Endpoint
      def list(*args, &block)
        arguments(args)

        response = get_request("/uploads", arguments.params)
        return response unless block_given?
        response.each(&block)
      end
      alias_method :all, :list

      def get(*args)
        arguments(args, required: [:upload_id])

        get_request("/uploads/#{upload_id}", arguments.params)
      end
      alias_method :find, :get

      def count(*args)
        arguments(args)

        get_request("/uploads/count", arguments.params)
      end

      def create(*args)
        arguments(args)

        post_request("/uploads", arguments.params)
      end

      def update(*args)
        arguments(args, required: [:upload_id])

        patch_request("/uploads/#{upload_id}", arguments.params)
      end
      alias_method :edit, :update

      def delete(*args)
        arguments(args, required: [:upload_id])

        delete_request("/uploads/#{upload_id}", arguments.params)
      end
      alias_method :remove, :delete
    end # Uploads
  end # Endpoints
end # Nimbu
