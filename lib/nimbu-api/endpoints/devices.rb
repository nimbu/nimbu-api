# encoding: utf-8

module Nimbu
  module Endpoints
    class Devices < Endpoint
      def list(*args)
        arguments(args)

        response = get_request("/devices", arguments.params)
        return response unless block_given?
        response.each { |el| yield el }
      end
      alias :all :list

      def count(*args)
        arguments(args)

        get_request("/devices/count", arguments.params)
      end

      def get(*args)
        arguments(args, :required => [:device_id])

        get_request("/devices/#{device_id}", arguments.params)
      end
      alias :find :get

      def create(*args)
        arguments(args)

        post_request("/devices", arguments.params)
      end

      def update(*args)
        arguments(args, :required => [:device_id])

        patch_request("/devices/#{device_id}", arguments.params)
      end
      alias :edit :update

      def delete(*args)
        arguments(args, :required => [:device_id])

        delete_request("/devices/#{device_id}", arguments.params)
      end
      alias :remove :delete

      def push(*args)
        arguments(args)

        query_params = arguments.params.delete("query")
        data = arguments.params

        post_request("/devices/push", data, params: query_params)
      end
      alias :message :push

    end # Devices
  end # Endpoints
end # Nimbu
