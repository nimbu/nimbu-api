# encoding: utf-8
# frozen_string_literal: true

require "nimbu-api/builder"

module Nimbu
  class Client < Endpoint
    def oauth(options = {}, &block)
      Nimbu::Builder.new("Authorizations", current_options.merge(options), &block)
    end
    alias_method :authorizations, :oauth

    def sites(options = {}, &block)
      Nimbu::Builder.new("Sites", current_options.merge(options), &block)
    end

    def themes(options = {}, &block)
      Nimbu::Builder.new("Themes", current_options.merge(options), &block)
    end

    def channels(options = {}, &block)
      Nimbu::Builder.new("Channels", current_options.merge(options), &block)
    end

    def videos(options = {}, &block)
      Nimbu::Builder.new("Videos", current_options.merge(options), &block)
    end

    def simulator(options = {}, &block)
      Nimbu::Builder.new("Simulator", current_options.merge(options), &block)
    end

    def products(options = {}, &block)
      Nimbu::Builder.new("Products", current_options.merge(options), &block)
    end

    def customers(options = {}, &block)
      Nimbu::Builder.new("Customers", current_options.merge(options), &block)
    end

    def collections(options = {}, &block)
      Nimbu::Builder.new("Collections", current_options.merge(options), &block)
    end

    def devices(options = {}, &block)
      Nimbu::Builder.new("Devices", current_options.merge(options), &block)
    end

    def coupons(options = {}, &block)
      Nimbu::Builder.new("Coupons", current_options.merge(options), &block)
    end

    def authenticate(options = {}, &block)
      Nimbu::Builder.new("Login", current_options.merge(options), &block).response
    end

    def users(options = {}, &block)
      Nimbu::Builder.new("Users", current_options.merge(options), &block)
    end

    def pages(options = {}, &block)
      Nimbu::Builder.new("Pages", current_options.merge(options), &block)
    end

    def menus(options = {}, &block)
      Nimbu::Builder.new("Menus", current_options.merge(options), &block)
    end

    def blogs(options = {}, &block)
      Nimbu::Builder.new("Blogs", current_options.merge(options), &block)
    end

    def redirects(options = {}, &block)
      Nimbu::Builder.new("Redirects", current_options.merge(options), &block)
    end

    def uploads(options = {}, &block)
      Nimbu::Builder.new("Uploads", current_options.merge(options), &block)
    end
  end # Client
end # Nimbu
