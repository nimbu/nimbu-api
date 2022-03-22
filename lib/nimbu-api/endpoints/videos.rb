# encoding: utf-8
# frozen_string_literal: true

module Nimbu
  module Endpoints
    class Videos < Endpoint
      def list(*args, &block)
        arguments(args)

        response = get_request("/videos", arguments.params)
        return response unless block_given?
        response.each(&block)
      end
      alias_method :all, :list

      def get(*args)
        arguments(args, required: [:video_id])

        get_request("/videos/#{video_id}", arguments.params)
      end
      alias_method :find, :get
    end # Authorizations
  end # Endpoints
end # Nimbu
