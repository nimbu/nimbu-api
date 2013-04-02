# encoding: utf-8

module Nimbu
  module Endpoints
    class Themes::Snippets < Endpoint

      def create(*args)
        arguments(args, :required => [:theme_id])

        post_request("/themes/#{theme_id}/snippets", arguments.params)
      end

      def delete(*args)
        arguments(args, :required => [:theme_id, :snippet_id])

        delete_request("/themes/#{theme_id}/snippets/#{snippet_id}", arguments.params)
      end
      alias :remove :delete


    end # Themes::Snippets
  end # Endpoints
end # Nimbu
