# encoding: utf-8

module Nimbu
  module Endpoints
    class Collections < Endpoint
      def list(*args)
        arguments(args)

        response = get_request("/collections", arguments.params)
        return response unless block_given?
        response.each { |el| yield el }
      end
      alias :all :list

      def get(*args)
        arguments(args, :required => [:collection_id])

        get_request("/collections/#{collection_id}", arguments.params)
      end
      alias :find :get

      def create(*args)
        arguments(args)

        post_request("/collections", arguments.params)
      end

      def update(*args)
        arguments(args, :required => [:collection_id])

        patch_request("/collections/#{collection_id}", arguments.params)
      end
      alias :edit :update

      def delete(*args)
        arguments(args, :required => [:collection_id])

        delete_request("/collections/#{collection_id}", arguments.params)
      end
      alias :remove :delete

    end # Products
  end # Endpoints
end # Nimbu
