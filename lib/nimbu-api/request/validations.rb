# encoding: utf-8

require 'nimbu-api/request/validations/presence'
require 'nimbu-api/request/validations/format'
require 'nimbu-api/request/validations/token'
require 'nimbu-api/request/validations/required'

module Nimbu
  module Request
    module Validations

      include Presence
      include Format
      include Token
      include Required

      VALID_API_KEYS = [
        'page',
        'per_page',
        'auto_pagination'
      ]

      end # Validation
    end # Request
  end # Nimbu
