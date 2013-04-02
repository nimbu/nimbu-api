# encoding: utf-8

module Nimbu
  module Endpoints
    class Themes < Endpoint

      def layouts(options={}, &block)
        Nimbu::Builder.new('Themes::Layouts', current_options.merge(options), &block)
      end

      def templates(options={}, &block)
        Nimbu::Builder.new('Themes::Templates', current_options.merge(options), &block)
      end

      def snippets(options={}, &block)
        Nimbu::Builder.new('Themes::Snippets', current_options.merge(options), &block)
      end

      def assets(options={}, &block)
        Nimbu::Builder.new('Themes::Assets', current_options.merge(options), &block)
      end

      def list(*args)
        arguments(args)

        response = get_request("/themes", arguments.params)
        return response unless block_given?
        response.each { |el| yield el }
      end
      alias :all :list

      def get(*args)
        arguments(args, :required => [:theme_id])

        get_request("/themes/#{theme_id}", arguments.params)
      end
      alias :find :get


    end # Themes
  end # Endpoints
end # Nimbu
