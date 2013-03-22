# encoding: utf-8

require 'nimbu-api/utils/all'

module Nimbu
  class Builder

    # Instantiates a new Nimbu api object
    #
    def self.new(klass, options={}, &block)
      return create_instance(klass, options, &block) if klass
      raise ArgumentError, 'must provide Endpoint class to be instantiated'
    end

    # Passes configuration options to instantiated class
    #
    def self.create_instance(klass, options, &block)
      options.symbolize_keys!
      convert_to_constant(klass.to_s).new options, &block
    end

    # Convert name to constant
    #
    def self.convert_to_constant(classes)
      classes.split('::').inject(Nimbu::Endpoints) do |constant, klass|
        constant.const_get klass
      end
    end

  end # Builder
end # Nimbu
