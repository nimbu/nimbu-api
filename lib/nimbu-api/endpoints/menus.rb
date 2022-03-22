# encoding: utf-8
# frozen_string_literal: true

module Nimbu
  module Endpoints
    class Menus < Endpoint
      def list(*args, &block)
        arguments(args)

        response = get_request("/menus", arguments.params)
        return response unless block_given?
        response.each(&block)
      end
      alias_method :all, :list

      def count(*args)
        get_request("/menus/count", arguments.params)
      end

      def get(*args)
        arguments(args, required: [:menu_id])

        get_request("/menus/#{menu_id}", arguments.params)
      end
      alias_method :find, :get

      def create(*args)
        arguments(args)

        post_request("/menus", arguments.params)
      end

      def update(*args)
        arguments(args, required: [:menu_id])

        patch_request("/menus/#{menu_id}", arguments.params)
      end
      alias_method :edit, :update

      def delete(*args)
        arguments(args, required: [:menu_id])

        delete_request("/menus/#{menu_id}", arguments.params)
      end
      alias_method :remove, :delete
    end # Menus
  end # Endpoints
end # Nimbu
