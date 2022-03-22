# encoding: utf-8
# frozen_string_literal: true

module Nimbu
  module Endpoints
    class Themes::Templates < Endpoint
      def create(*args)
        arguments(args, required: [:theme_id])

        forced = arguments.params.delete("force")
        query_params = {}
        query_params = { force: forced } unless forced.nil?

        post_request("/themes/#{theme_id}/templates", arguments.params, params: query_params)
      end

      def get(*args)
        arguments(args, required: [:theme_id, :template_id])

        get_request("/themes/#{theme_id}/templates/#{template_id}", arguments.params)
      end

      def delete(*args)
        arguments(args, required: [:theme_id, :template_id])

        delete_request("/themes/#{theme_id}/templates/#{template_id}", arguments.params)
      end
      alias_method :remove, :delete
    end # Themes::Templates
  end # Endpoints
end # Nimbu
