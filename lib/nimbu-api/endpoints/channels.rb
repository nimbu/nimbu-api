# encoding: utf-8
# frozen_string_literal: true

module Nimbu
  module Endpoints
    class Channels < Endpoint
      def entries(options = {}, &block)
        Nimbu::Builder.new("Channels::Entries", current_options.merge(options), &block)
      end

      def list(*args, &block)
        arguments(args)

        response = get_request("/channels", arguments.params)
        return response unless block_given?
        response.each(&block)
      end
      alias_method :all, :list

      def first(*args)
        arguments(args)

        get_request("/channels", arguments.params.merge(limit: 1)).first
      end

      def get(*args)
        arguments(args, required: [:channel_id])

        get_request("/channels/#{channel_id}", arguments.params)
      end
      alias_method :find, :get

      def webhooks(*args)
        arguments(args, required: [:channel_id])

        get_request("/channels/#{channel_id}/webhooks", arguments.params)
      end

      def add_webhook(*args)
        arguments(args, required: [:channel_id])

        post_request("/channels/#{channel_id}/webhooks", arguments.params)
      end

      def poll_webhook(*args)
        arguments(args, required: [:channel_id])

        post_request("/channels/#{channel_id}/webhooks/poll", arguments.params)
      end
    end # Authorizations
  end # Endpoints
end # Nimbu
