require "nimbu-api/version"

require 'openssl'
require 'excon'
require 'faraday'
require 'multi_json'

require "nimbu-api/utils/all"
require "nimbu-api/configuration"
require "nimbu-api/connection"
require 'nimbu-api/pagination'
require 'nimbu-api/response'
require 'nimbu-api/request'
require 'nimbu-api/authentication'
require 'nimbu-api/endpoint'
require 'nimbu-api/client'

require 'nimbu-api/endpoints/authorizations'
require 'nimbu-api/endpoints/login'
require 'nimbu-api/endpoints/simulator'
require 'nimbu-api/endpoints/sites'
require 'nimbu-api/endpoints/themes'
require 'nimbu-api/endpoints/themes/layouts'
require 'nimbu-api/endpoints/themes/templates'
require 'nimbu-api/endpoints/themes/snippets'
require 'nimbu-api/endpoints/themes/assets'
require 'nimbu-api/endpoints/channels'
require 'nimbu-api/endpoints/channels/entries'
require 'nimbu-api/endpoints/products'
require 'nimbu-api/endpoints/collections'
require 'nimbu-api/endpoints/videos'

module Nimbu
  extend Configuration

  class << self
    def new(options = {}, &block)
      Nimbu::Client.new(options, &block)
    end

    # Delegate to Nimbu::Client
    #
    def method_missing(method, *args, &block)
      return super unless new.respond_to?(method)
      new.send(method, *args, &block)
    end

    def respond_to?(method, include_private = false)
      new.respond_to?(method, include_private) || super(method, include_private)
    end

  end
end # Nimbu