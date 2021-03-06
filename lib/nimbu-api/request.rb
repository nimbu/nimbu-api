# encoding: utf-8

require 'nimbu-api/request/oauth2'
require 'nimbu-api/request/basic_auth'
require 'nimbu-api/request/json'
require 'nimbu-api/request/validations'
require 'nimbu-api/request/arguments'
require 'nimbu-api/request/user_agent'
require 'nimbu-api/request/site_header'
require 'nimbu-api/request/content_locale'

module Nimbu

  # Defines HTTP verbs
  module Request
    include Nimbu::Utils::Constants

    METHODS = [:get, :post, :put, :delete, :patch]
    METHODS_WITH_BODIES = [ :post, :put, :patch ]

    def get_request(path, params={}, options={})
      request(:get, path, params, options)
    end

    def patch_request(path, params={}, options={})
      request(:patch, path, params, options)
    end

    def post_request(path, params={}, options={})
      request(:post, path, params, options)
    end

    def put_request(path, params={}, options={})
      request(:put, path, params, options)
    end

    def delete_request(path, params={}, options={})
      request(:delete, path, params, options)
    end

    def request(method, path, params, options) # :nodoc:
      if !METHODS.include?(method)
        raise ArgumentError, "unkown http method: #{method}"
      end

      puts "EXECUTED: #{method} - #{path} with #{params} and #{options}" if ENV['DEBUG']

      conn = connection(options.merge(current_options))
      if conn.path_prefix != '/' && path.index(conn.path_prefix) != 0
        path = (conn.path_prefix + path).gsub(/\/(\/)*/, '/')
      end

      response = conn.send(method) do |request|
        unless options[:with_attachments]
          case method.to_sym
          when *(METHODS - METHODS_WITH_BODIES)
            request.body = params.delete('data') if params.has_key?('data')
            request.url(path, params)
          when *METHODS_WITH_BODIES
            request.path = path
            request.body = extract_data_from_params(params) unless params.empty?
          end
        else
          request.body = params
          request.url(path)
        end
      end
      Response::Wrapper.new(response, self).auto_paginate
    end

    private

    def extract_data_from_params(params) # :nodoc:
      return params['data'] if params.has_key?('data') and !params['data'].nil?
      return params
    end

    def _extract_mime_type(params, options) # :nodoc:
      options['resource']  = params['resource'] ? params.delete('resource') : ''
      options['mime_type'] = params['resource'] ? params.delete('mime_type') : ''
    end

  end # Request
end # Nimbu
