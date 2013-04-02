# encoding: utf-8

module Nimbu
  module Endpoints
    class Themes::Assets < Endpoint

      def create(*args)
        arguments(args, :required => [:theme_id])

        post_request("/themes/#{theme_id}/assets", arguments.params, :with_attachments => true)
      end

      def delete(*args)
        arguments(args, :required => [:theme_id, :asset_id])

        delete_request("/themes/#{theme_id}/assets/#{asset_id}", arguments.params)
      end
      alias :remove :delete


    end # Themes::Layouts
  end # Endpoints
end # Nimbu