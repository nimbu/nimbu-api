# encoding: utf-8

module Nimbu
  module Connection
    extend self
    include Nimbu::Utils::Constants

    ALLOWED_OPTIONS = [
      :headers,
      :url,
      :params,
      :request,
      :ssl
    ].freeze

    def default_options(options={})
      {
        :ssl => options.fetch(:ssl) { ssl },
        :url => options.fetch(:endpoint) { Nimbu.endpoint }
      }.merge(options)
    end

    # Default middleware stack that uses default adapter as specified at
    # configuration stage.
    #
    def default_middleware(options={})
      Proc.new do |builder|
        unless options[:with_attachments]
          builder.use Nimbu::Request::Json
        end
        builder.use Faraday::Request::Multipart
        builder.use Faraday::Request::UrlEncoded
        builder.use Nimbu::Request::OAuth2, oauth_token if oauth_token?
        builder.use Nimbu::Request::BasicAuth, authentication if basic_authed?
        builder.use Nimbu::Request::UserAgent
        builder.use Nimbu::Request::SiteHeader, subdomain
        builder.use Nimbu::Request::ContentLocale, content_locale

        builder.use Faraday::Response::Logger if ENV['DEBUG']
        builder.use Nimbu::Response::RaiseError
        unless options[:raw]
          builder.use Nimbu::Response::Mashify
          builder.use Nimbu::Response::Json
        end
        builder.adapter adapter
      end
    end

    @connection = nil

    @stack = nil

    def clear_cache
      @connection = nil
    end

    def caching?
      !@connection.nil?
    end

    # Exposes middleware builder to facilitate custom stacks and easy
    # addition of new extensions such as cache adapter.
    #
    def stack(options={}, &block)
      @stack ||= begin
        if block_given?
          Faraday::RackBuilder.new(&block)
        else
          Faraday::RackBuilder.new(&default_middleware(options))
        end
      end
    end

    # Returns a Fraday::Connection object
    #
    def connection(options={})
      conn_options = default_options(options).keep_if {|k,_| ALLOWED_OPTIONS.include? k }
      clear_cache unless options.empty?
      puts "OPTIONS:#{conn_options.inspect}" if ENV['DEBUG']

      Faraday.new(conn_options.merge(:builder => stack(options)))
    end

  end # Connection
end # Nimbu
