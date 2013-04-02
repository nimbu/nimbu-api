# encoding: utf-8

module Nimbu
  module Endpoints
    class Themes::Layouts < Endpoint

      def create(*args)
        arguments(args, :required => [:theme_id])

        post_request("/themes/#{theme_id}/layouts", arguments.params)
      end

      def delete(*args)
        arguments(args, :required => [:theme_id, :layout_id])

        delete_request("/themes/#{theme_id}/layouts/#{layout_id}", arguments.params)
      end
      alias :remove :delete


    end # Themes::Layouts
  end # Endpoints
end # Nimbu
