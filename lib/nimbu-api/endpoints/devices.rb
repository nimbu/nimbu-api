# encoding: utf-8
# frozen_string_literal: true

module Nimbu
  module Endpoints
    class Devices < Endpoint
      def list(*args, &block)
        arguments(args)

        response = get_request("/devices", arguments.params)
        return response unless block_given?
        response.each(&block)
      end
      alias_method :all, :list

      def count(*args)
        arguments(args)

        get_request("/devices/count", arguments.params)
      end

      def get(*args)
        arguments(args, required: [:device_id])

        get_request("/devices/#{device_id}", arguments.params)
      end
      alias_method :find, :get

      def create(*args)
        arguments(args)

        post_request("/devices", arguments.params)
      end

      def update(*args)
        arguments(args, required: [:device_id])

        patch_request("/devices/#{device_id}", arguments.params)
      end
      alias_method :edit, :update

      def delete(*args)
        arguments(args, required: [:device_id])

        delete_request("/devices/#{device_id}", arguments.params)
      end
      alias_method :remove, :delete

      def push(*args)
        arguments(args)

        query_params = arguments.params.delete("query")
        data = arguments.params

        post_request("/devices/push", data, params: query_params)
      end
      alias_method :message, :push
    end # Devices
  end # Endpoints
end # Nimbu
