# encoding: utf-8

require 'faraday'

module Nimbu
  class Request::SiteHeader < Faraday::Middleware
    include Nimbu::Utils::Constants

    def call(env)
      env[:request_headers].merge!(NIMBU_SITE => @subdomain) if @subdomain
      @app.call env
    end

    def initialize(app, *args)
      super app
      @app = app
      @subdomain = args.shift
    end


  end # Request::SiteHeader
end # Nimbu