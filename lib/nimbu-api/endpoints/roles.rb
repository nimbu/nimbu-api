# encoding: utf-8

module Nimbu
  module Endpoints
    class Roles < Endpoint
      def list(*args)
        arguments(args)

        response = get_request("/roles", arguments.params)
        return response unless block_given?
        response.each { |el| yield el }
      end
      alias :all :list

      def get(*args)
        arguments(args, :required => [:role_id])

        get_request("/roles/#{role_id}", arguments.params)
      end
      alias :find :get

      def create(*args)
        arguments(args)

        post_request("/roles", arguments.params)
      end

      def update(*args)
        arguments(args, :required => [:role_id])

        patch_request("/roles/#{role_id}", arguments.params)
      end
      alias :edit :update

      def delete(*args)
        arguments(args, :required => [:role_id])

        delete_request("/roles/#{role_id}", arguments.params)
      end
      alias :remove :delete

    end # Roles
  end # Endpoints
end # Nimbu
