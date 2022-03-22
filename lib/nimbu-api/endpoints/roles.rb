# encoding: utf-8
# frozen_string_literal: true

module Nimbu
  module Endpoints
    class Roles < Endpoint
      def list(*args, &block)
        arguments(args)

        response = get_request("/roles", arguments.params)
        return response unless block_given?
        response.each(&block)
      end
      alias_method :all, :list

      def get(*args)
        arguments(args, required: [:role_id])

        get_request("/roles/#{role_id}", arguments.params)
      end
      alias_method :find, :get

      def create(*args)
        arguments(args)

        post_request("/roles", arguments.params)
      end

      def update(*args)
        arguments(args, required: [:role_id])

        patch_request("/roles/#{role_id}", arguments.params)
      end
      alias_method :edit, :update

      def delete(*args)
        arguments(args, required: [:role_id])

        delete_request("/roles/#{role_id}", arguments.params)
      end
      alias_method :remove, :delete
    end # Roles
  end # Endpoints
end # Nimbu
