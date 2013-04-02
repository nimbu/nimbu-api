# encoding: utf-8

module Nimbu
  module Endpoints
    class Themes::Templates < Endpoint

      def create(*args)
        arguments(args, :required => [:theme_id])

        post_request("/themes/#{theme_id}/templates", arguments.params)
      end

      def delete(*args)
        arguments(args, :required => [:theme_id, :template_id])

        delete_request("/themes/#{theme_id}/templates/#{template_id}", arguments.params)
      end
      alias :remove :delete


    end # Themes::Templates
  end # Endpoints
end # Nimbu
