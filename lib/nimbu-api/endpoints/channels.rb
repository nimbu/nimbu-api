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

      def get(*args)
        arguments(args, :required => [:channel_id])

        get_request("/channels/#{channel_id}", arguments.params)
      end
      alias :find :get


    end # Authorizations
  end # Endpoints
end # Nimbu
