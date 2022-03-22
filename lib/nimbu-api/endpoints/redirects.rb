# encoding: utf-8
# frozen_string_literal: true

module Nimbu
  module Endpoints
    class Redirects < Endpoint
      def list(*args, &block)
        arguments(args)

        response = get_request("/redirects", arguments.params)
        return response unless block_given?
        response.each(&block)
      end
      alias_method :all, :list

      def get(*args)
        arguments(args, required: [:redirect_id])

        get_request("/redirects/#{redirect_id}", arguments.params)
      end
      alias_method :find, :get

      def count(*args)
        arguments(args)

        get_request("/redirects/count", arguments.params)
      end

      def create(*args)
        arguments(args)

        post_request("/redirects", arguments.params)
      end

      def update(*args)
        arguments(args, required: [:redirect_id])

        patch_request("/redirects/#{redirect_id}", arguments.params)
      end
      alias_method :edit, :update

      def delete(*args)
        arguments(args, required: [:redirect_id])

        delete_request("/redirects/#{redirect_id}", arguments.params)
      end
      alias_method :remove, :delete
    end # Redirects
  end # Endpoints
end # Nimbu
