# encoding: utf-8
# frozen_string_literal: true

module Nimbu
  module Endpoints
    class Webhooks < Endpoint
      def list(*args, &block)
        arguments(args)

        response = get_request("/webhooks", arguments.params)
        return response unless block_given?
        response.each(&block)
      end
      alias_method :all, :list

      def get(*args)
        arguments(args, required: [:webhook_id])

        get_request("/webhooks/#{webhook_id}", arguments.params)
      end
      alias_method :find, :get

      def delete(*args)
        arguments(args, required: [:webhook_id])

        delete_request("/webhooks/#{webhook_id}", arguments.params)
      end
      alias_method :remove, :delete
    end # Webhooks
  end # Endpoints
end # Nimbu
