# encoding: utf-8

require 'faraday'

module Nimbu
  module Request
    class ContentLocale < Faraday::Middleware
      include Nimbu::Utils::Url

      CONTENT_LOCALE = 'content_locale'.freeze

      def call(env)
        if @content_locale
          params =  { CONTENT_LOCALE => @content_locale }.update query_params(env[:url])
          env[:url].query = build_query params
        end

        @app.call env
      end

      def initialize(app, *args)
        super app
        @app = app
        @content_locale = args.shift
      end

      def query_params(url)
        if url.query.nil? or url.query.empty?
          {}
        else
          parse_query url.query
        end
      end

    end
  end
end