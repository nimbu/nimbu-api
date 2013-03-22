# encoding: utf-8

module Nimbu
  module Configuration

    VALID_OPTIONS_KEYS = [
      :client_id,
      :client_secret,
      :oauth_token,
      :endpoint,
      :site,
      :ssl,
      :mime_type,
      :user_agent,
      :connection_options,
      :login,
      :password,
      :basic_auth,
      :auto_pagination,
      :adapter
    ].freeze

    # By default, don't set an application key
    DEFAULT_CLIENT_ID = nil

    # By default, don't set an application secret
    DEFAULT_CLIENT_SECRET = nil

    # By default, don't set a user oauth access token
    DEFAULT_OAUTH_TOKEN = nil

    # By default, don't set a user login name
    DEFAULT_LOGIN = nil

    # By default, don't set a user password
    DEFAULT_PASSWORD = nil

    # By default, don't set a user basic authentication
    DEFAULT_BASIC_AUTH = nil

    # The api endpoint used to connect to Nimbu if none is set
    DEFAULT_ENDPOINT = 'https://api.nimbu.io'.freeze

    # The web endpoint used to connect to Nimbu if none is set
    DEFAULT_SITE = 'https://www.nimbu.io'.freeze

    # The default SSL configuration
    DEFAULT_SSL = {}

    # The value sent in the http header for 'User-Agent' if none is set
    DEFAULT_USER_AGENT = "Nimbu Ruby Gem #{Nimbu::VERSION}".freeze

    # By default the <tt>Accept</tt> header will make a request for <tt>JSON</tt>
    DEFAULT_MIME_TYPE = :json

    # By default uses the Faraday connection options if none is set
    DEFAULT_CONNECTION_OPTIONS = {}

    # By default, don't traverse the page links
    DEFAULT_AUTO_PAGINATION = false

    # Other adapters are :typhoeus, :patron, :em_synchrony, :excon, :test
    DEFAULT_ADAPTER = :net_http

    attr_accessor *VALID_OPTIONS_KEYS

    # Convenience method to allow for global setting of configuration options
    def configure
      yield self
    end

    def self.extended(base)
      base.reset!
    end

    class << self
      def keys
        VALID_OPTIONS_KEYS
      end
    end

    def options
      options = {}
      VALID_OPTIONS_KEYS.each { |k| options[k] = send(k) }
      options
    end

    # Reset configuration options to their defaults
    #
    def reset!
      self.client_id          = DEFAULT_CLIENT_ID
      self.client_secret      = DEFAULT_CLIENT_SECRET
      self.oauth_token        = DEFAULT_OAUTH_TOKEN
      self.endpoint           = DEFAULT_ENDPOINT
      self.site               = DEFAULT_SITE
      self.ssl                = DEFAULT_SSL
      self.user_agent         = DEFAULT_USER_AGENT
      self.connection_options = DEFAULT_CONNECTION_OPTIONS
      self.mime_type          = DEFAULT_MIME_TYPE
      self.login              = DEFAULT_LOGIN
      self.password           = DEFAULT_PASSWORD
      self.basic_auth         = DEFAULT_BASIC_AUTH
      self.auto_pagination    = DEFAULT_AUTO_PAGINATION
      self.adapter            = DEFAULT_ADAPTER
      self
    end

  end # Configuration
end # Nimbu
