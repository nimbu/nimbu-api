# encoding: utf-8

require 'multi_json'

module Nimbu
  module Utils
    module Json
      extend self

      def decode(*args)
        if MultiJson.respond_to?(:load)
          MultiJson.load(*args)
        else
          MultiJson.decode(*args)
        end
      end
    end
  end
end