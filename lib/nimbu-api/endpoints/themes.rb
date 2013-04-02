# encoding: utf-8

module Nimbu
  module Endpoints
    class Themes < Endpoint

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
