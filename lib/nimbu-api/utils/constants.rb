module Nimbu
  module Utils
    module Constants
      extend self

      # Request headers
      USER_AGENT = 'User-Agent'.freeze
      ACCEPT = 'Accept'.freeze
      ACCEPT_CHARSET = 'Accept-Charset'.freeze
      NIMBU_SITE = 'X-Nimbu-Site'.freeze

      # Response headers
      RATELIMIT_REMAINING = 'X-RateLimit-Remaining'.freeze
      RATELIMIT_LIMIT = 'X-RateLimit-Limit'.freeze
      CONTENT_TYPE = 'Content-Type'.freeze
      CONTENT_LENGTH = 'content-length'.freeze
      CACHE_CONTROL = 'cache-control'.freeze
      ETAG = 'ETag'.freeze
      SERVER = 'Server'.freeze
      DATE = 'Date'.freeze
      LOCATION = 'Location'.freeze
      OAUTH_SCOPES = 'X-Oauth-Scopes'.freeze
      ACCEPTED_OAUTH_SCOPES = 'X-Accepted-Oauth-Scopes'.freeze

      # Link headers
      HEADER_LINK = "Link".freeze
      HEADER_NEXT = "X-Next".freeze
      HEADER_LAST = "X-Last".freeze
      META_REL = "rel".freeze
      META_LAST = "last".freeze
      META_NEXT = "next".freeze
      META_FIRST = "first".freeze
      META_PREV = "prev".freeze
      PARAM_PAGE = "page".freeze
      PARAM_PER_PAGE = "per_page".freeze
      PARAM_START_PAGE = "start_page".freeze

    end # Constants
  end # Utils
end # Nimbu
