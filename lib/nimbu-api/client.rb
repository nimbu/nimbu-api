# encoding: utf-8

require 'nimbu-api/builder'

module Nimbu
  class Client < Endpoint

    def oauth(options={}, &block)
      Nimbu::Builder.new('Authorizations', current_options.merge(options), &block)
    end
    alias :authorizations :oauth

    def sites(options={}, &block)
      Nimbu::Builder.new('Sites', current_options.merge(options), &block)
    end

    def channels(options={}, &block)
      Nimbu::Builder.new('Channels', current_options.merge(options), &block)
    end

    def videos(options={}, &block)
      Nimbu::Builder.new('Videos', current_options.merge(options), &block)
    end

  end # Client
end # Nimbu
