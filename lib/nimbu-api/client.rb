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

    def themes(options={}, &block)
      Nimbu::Builder.new('Themes', current_options.merge(options), &block)
    end

    def channels(options={}, &block)
      Nimbu::Builder.new('Channels', current_options.merge(options), &block)
    end

    def videos(options={}, &block)
      Nimbu::Builder.new('Videos', current_options.merge(options), &block)
    end

    def simulator(options={}, &block)
      Nimbu::Builder.new('Simulator', current_options.merge(options), &block)
    end

    def products(options={}, &block)
      Nimbu::Builder.new('Products', current_options.merge(options), &block)
    end

    def customers(options={}, &block)
      Nimbu::Builder.new('Customers', current_options.merge(options), &block)
    end

    def collections(options={}, &block)
      Nimbu::Builder.new('Collections', current_options.merge(options), &block)
    end

    def devices(options={}, &block)
      Nimbu::Builder.new('Devices', current_options.merge(options), &block)
    end

    def coupons(options={}, &block)
      Nimbu::Builder.new('Coupons', current_options.merge(options), &block)
    end

    def authenticate(options={}, &block)
      Nimbu::Builder.new('Login', current_options.merge(options), &block).response
    end

  end # Client
end # Nimbu
