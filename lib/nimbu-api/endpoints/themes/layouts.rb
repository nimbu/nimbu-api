# encoding: utf-8
module Nimbu
  module Endpoints
    class Themes::Layouts < Endpoint

      def create(*args)
        arguments(args, :required => [:theme_id])

        forced = arguments.params.delete("force")
        query_params = {}
        query_params = {force: forced} unless forced.nil?

        post_request("/themes/#{theme_id}/layouts", arguments.params, params: query_params)
      end

      def get(*args)
        arguments(args, :required => [:theme_id, :layout_id])

        get_request("/themes/#{theme_id}/layouts/#{layout_id}", arguments.params)
      end

      def delete(*args)
        arguments(args, :required => [:theme_id, :layout_id])

        delete_request("/themes/#{theme_id}/layouts/#{layout_id}", arguments.params)
      end
      alias :remove :delete


    end # Themes::Layouts
  end # Endpoints
end # Nimbu
