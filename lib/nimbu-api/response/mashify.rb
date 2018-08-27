# encoding: utf-8

require 'faraday'

module Nimbu
  class Response::Mashify < Response
    dependency 'hashie/mash'

    define_parser do |body|
      Result.new body
    end

    def parse(body)
      case body
      when Hash
        self.class.parser.call body
      when Array
        body.map { |item| item.is_a?(Hash) ? self.class.parser.call(item) : item }
      else
        body
      end
    end

    class Result < ::Hashie::Mash
      disable_warnings
    end
  end # Response::Mashify
end # Nimbu
