# encoding: utf-8
# frozen_string_literal: true

module Nimbu
  module Endpoints
    class Themes < Endpoint
      def layouts(options = {}, &block)
        Nimbu::Builder.new("Themes::Layouts", current_options.merge(options), &block)
      end

      def templates(options = {}, &block)
        Nimbu::Builder.new("Themes::Templates", current_options.merge(options), &block)
      end

      def snippets(options = {}, &block)
        Nimbu::Builder.new("Themes::Snippets", current_options.merge(options), &block)
      end

      def assets(options = {}, &block)
        Nimbu::Builder.new("Themes::Assets", current_options.merge(options), &block)
      end

      def list(*args, &block)
        arguments(args)

        response = get_request("/themes", arguments.params)
        return response unless block_given?
        response.each(&block)
      end
      alias_method :all, :list

      def get(*args)
        arguments(args, required: [:theme_id])

        get_request("/themes/#{theme_id}", arguments.params)
      end
      alias_method :find, :get
    end # Themes
  end # Endpoints
end # Nimbu
