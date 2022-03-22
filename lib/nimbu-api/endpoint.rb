# -*- encoding: utf-8 -*-
# frozen_string_literal: true

module Nimbu
  # Core class for api interface operations
  class Endpoint
    include ::Nimbu::Utils::Constants
    include Authentication
    include Connection
    include Request

    attr_reader(*Configuration.keys)
    attr_accessor(*Request::Validations::VALID_API_KEYS)

    attr_accessor :current_options

    # Returns all API public methods for a given class.
    def self.inherited(klass)
      klass.class_eval(<<-RUBY_EVAL, __FILE__, __LINE__ + 1)
        def self.actions
          self.new.api_methods_in(#{klass})
        end
        def actions
          api_methods_in(#{klass})
        end
      RUBY_EVAL
      super
    end

    def api_methods_in(klass)
      puts "---"
      (klass.send(:instance_methods, false) - ["actions"]).sort.each do |method|
        puts "|--> #{method}"
      end
      klass.included_modules.each do |mod|
        next unless /#{klass}/.match?(mod.to_s)
        puts "| \\ #{mod}"
        mod.instance_methods(false).each do |met|
          puts "|  |--> #{met}"
        end
        puts "| /"
      end
      puts "---"
      nil
    end

    def append_arguments(method)
      _method = self.method(method)
      args = if _method.arity == 0
        "()"
      elsif _method.arity > 0
        "(few)"
      else
        "(else)"
      end
      args
    end

    # Callback to update current configuration options
    class_eval do
      Configuration.keys.each do |key|
        define_method "#{key}=" do |arg|
          instance_variable_set("@#{key}", arg)
          current_options.merge!({ "#{key}": arg })
        end
      end
    end

    # Create new API
    #
    def initialize(options = {}, &block)
      setup(options)
      client(options) if client_id? && client_secret?
      yield_or_eval(&block) if block_given?
    end

    def yield_or_eval(&block)
      return unless block
      block.arity > 0 ? yield(self) : instance_eval(&block)
    end

    # Configure options and process basic authorization
    #
    def setup(options = {})
      options.each do |k, v|
        set(k, v, true)
      end
      options = Nimbu.options.merge(options)
      self.current_options = options
      Configuration.keys.each do |key|
        send("#{key}=", options[key])
      end
      process_basic_auth(options[:basic_auth])
    end

    # Extract login and password from basic_auth parameter
    #
    def process_basic_auth(auth)
      case auth
      when String
        self.login, self.password = auth.split(":", 2)
      when Hash
        self.login    = auth[:login]
        self.password = auth[:password]
      end
    end

    # Responds to attribute query or attribute clear
    def method_missing(method, *args, &block) # :nodoc:
      case method.to_s
      when /^(.*)\?$/
        !!send(Regexp.last_match(1).to_s)
      when /^clear_(.*)$/
        send("#{Regexp.last_match(1)}=", nil)
      else
        super
      end
    end

    # Acts as setter and getter for api requests arguments parsing.
    #
    # Returns Arguments instance.
    #
    def arguments(args = (not_set = true), options = {}, &block)
      if not_set
        @arguments
      else
        @arguments = Arguments.new(self, options).parse(*args, &block)
      end
    end

    # Scope for passing request required arguments.
    #
    def with(args)
      case args
      when Hash
        set(args)
      else
        ::Kernel.raise ArgumentError, "This api does not support passed in arguments"
      end
    end

    # Set an option to a given value
    def set(option, value = (not_set = true), ignore_setter = false, &block)
      raise ArgumentError, "value not set" if block and !not_set
      return self if !not_set and value.nil?

      if not_set
        set_options(option)
        return self
      end

      if respond_to?("#{option}=") and !ignore_setter
        return __send__("#{option}=", value)
      end

      define_accessors(option, value)
      self
    end

    private

    # Set multiple options
    #
    def set_options(options)
      unless options.respond_to?(:each)
        raise ArgumentError, "cannot iterate over value"
      end
      options.each { |key, value| set(key, value) }
    end

    def define_accessors(option, value)
      setter = proc { |val| set(option, val, true) }
      getter = proc { value }

      define_singleton_method("#{option}=", setter) if setter
      define_singleton_method(option, getter) if getter
    end

    # Dynamically define a method for setting request option
    #
    def define_singleton_method(method_name, content = Proc.new)
      (class << self; self; end).class_eval do
        undef_method(method_name) if method_defined?(method_name)
        if String === content
          class_eval("def #{method_name}() #{content}; end")
        else
          define_method(method_name, &content)
        end
      end
    end

    def _merge_mime_type(resource, params) # :nodoc:
      #       params['resource'] = resource
      #       params['mime_type'] = params['mime_type'] || :raw
    end
  end # Endpoint
end # Nimbu
