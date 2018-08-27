# encoding: utf-8

module Nimbu
  module Endpoints
    class Webhooks < Endpoint
      def list(*args)
        arguments(args)

        response = get_request("/webhooks", arguments.params)
        return response unless block_given?
        response.each { |el| yield el }
      end
      alias :all :list

      def get(*args)
        arguments(args, :required => [:webhook_id])

        get_request("/webhooks/#{webhook_id}", arguments.params)
      end
      alias :find :get

      def delete(*args)
        arguments(args, :required => [:webhook_id])

        delete_request("/webhooks/#{webhook_id}", arguments.params)
      end
      alias :remove :delete

    end # Webhooks
  end # Endpoints
end # Nimbu
