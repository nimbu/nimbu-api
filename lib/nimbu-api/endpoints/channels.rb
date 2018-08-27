# encoding: utf-8


module Nimbu
  module Endpoints
    class Channels < Endpoint

      def entries(options={}, &block)
        Nimbu::Builder.new('Channels::Entries', current_options.merge(options), &block)
      end

      def list(*args)
        arguments(args)

        response = get_request("/channels", arguments.params)
        return response unless block_given?
        response.each { |el| yield el }
      end
      alias :all :list

      def first(*args)
        arguments(args)

        get_request("/channels", arguments.params.merge(limit: 1)).first
      end

      def get(*args)
        arguments(args, :required => [:channel_id])

        get_request("/channels/#{channel_id}", arguments.params)
      end
      alias :find :get

      def webhooks(*args)
        arguments(args, :required => [:channel_id])

        get_request("/channels/#{channel_id}/webhooks", arguments.params)
      end

      def add_webhook(*args)
        arguments(args, :required => [:channel_id])

        post_request("/channels/#{channel_id}/webhooks", arguments.params)
      end

      def poll_webhook(*args)
        arguments(args, :required => [:channel_id])

        post_request("/channels/#{channel_id}/webhooks/poll", arguments.params)
      end

    end # Authorizations
  end # Endpoints
end # Nimbu
