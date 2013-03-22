# encoding: utf-8

require 'faraday'
require 'nimbu-api/utils/json'

module Nimbu
  class Response::Json < Response
    include Nimbu::Utils::Json

    dependency 'multi_json'

    define_parser do |body|
      Nimbu::Utils::Json.decode body
    end

    def parse(body)
      case body
      when ''
        nil
      when 'true'
        true
      when 'false'
        false
      else
        self.class.parser.call body
      end
    end
  end # Response::Json
end # Nimbu
