# encoding: utf-8
# frozen_string_literal: true

module Nimbu
  module Endpoints
    class Pages < Endpoint
      def list(*args, &block)
        arguments(args)

        response = get_request("/pages", arguments.params)
        return response unless block_given?
        response.each(&block)
      end
      alias_method :all, :list

      def get(*args)
        arguments(args, required: [:page_id])

        get_request("/pages/#{page_id}", arguments.params)
      end
      alias_method :find, :get

      def count(*args)
        arguments(args)

        get_request("/pages/count", arguments.params)
      end

      def create(*args)
        arguments(args)

        post_request("/pages", arguments.params, with_attachments: true)
      end

      def update(*args)
        arguments(args, required: [:page_id])

        patch_request("/pages/#{page_id}", arguments.params, with_attachments: true)
      end
      alias_method :edit, :update

      def delete(*args)
        arguments(args, required: [:page_id])

        delete_request("/pages/#{page_id}", arguments.params)
      end
      alias_method :remove, :delete
    end # Pages
  end # Endpoints
end # Nimbu
