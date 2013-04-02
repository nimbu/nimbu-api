# encoding: utf-8

require 'faraday'

module Nimbu
  class Request::UserAgent < Faraday::Middleware
    include Nimbu::Utils::Constants

    def call(env)
      env[:request_headers].merge!(USER_AGENT => Nimbu.user_agent)

      @app.call env
    end

  end # Request::UserAgent
end # Nimbu