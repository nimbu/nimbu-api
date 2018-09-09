# encoding: utf-8

module Nimbu
  module Endpoints
    class Themes::Snippets < Endpoint

      def create(*args)
        arguments(args, :required => [:theme_id])

        forced = arguments.params.delete("force")
        query_params = {}
        query_params = {force: forced} unless forced.nil?

        post_request("/themes/#{theme_id}/snippets", arguments.params, params: query_params)
      end

      def get(*args)
        arguments(args, :required => [:theme_id, :snippet_id])

        get_request("/themes/#{theme_id}/snippets/#{snippet_id}", arguments.params)
      end

      def delete(*args)
        arguments(args, :required => [:theme_id, :snippet_id])

        delete_request("/themes/#{theme_id}/snippets/#{snippet_id}", arguments.params)
      end
      alias :remove :delete


    end # Themes::Snippets
  end # Endpoints
end # Nimbu
