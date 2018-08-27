# encoding: utf-8

module Nimbu
  module Endpoints
    class Translations < Endpoint
      def list(*args)
        arguments(args)

        response = get_request("/translations", arguments.params)
        return response unless block_given?
        response.each { |el| yield el }
      end
      alias :all :list

      def get(*args)
        arguments(args, :required => [:translation_id])

        get_request("/translations/#{translation_id}", arguments.params)
      end
      alias :find :get

      def count(*args)
        arguments(args)

        get_request("/translations/count", arguments.params)
      end

      def create(*args)
        arguments(args)

        post_request("/translations", arguments.params)
      end

      def update(*args)
        arguments(args, :required => [:translation_id])

        patch_request("/translations/#{translation_id}", arguments.params)
      end
      alias :edit :update

      def delete(*args)
        arguments(args, :required => [:translation_id])

        delete_request("/translations/#{translation_id}", arguments.params)
      end
      alias :remove :delete

    end # Translations
  end # Endpoints
end # Nimbu
