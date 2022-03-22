# encoding: utf-8
# frozen_string_literal: true

module Nimbu
  module Endpoints
    class Translations < Endpoint
      def list(*args, &block)
        arguments(args)

        response = get_request("/translations", arguments.params)
        return response unless block_given?
        response.each(&block)
      end
      alias_method :all, :list

      def get(*args)
        arguments(args, required: [:translation_id])

        get_request("/translations/#{translation_id}", arguments.params)
      end
      alias_method :find, :get

      def count(*args)
        arguments(args)

        get_request("/translations/count", arguments.params)
      end

      def create(*args)
        arguments(args)

        post_request("/translations", arguments.params)
      end

      def update(*args)
        arguments(args, required: [:translation_id])

        patch_request("/translations/#{translation_id}", arguments.params)
      end
      alias_method :edit, :update

      def delete(*args)
        arguments(args, required: [:translation_id])

        delete_request("/translations/#{translation_id}", arguments.params)
      end
      alias_method :remove, :delete
    end # Translations
  end # Endpoints
end # Nimbu
