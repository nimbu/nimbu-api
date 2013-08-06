# encoding: utf-8

module Nimbu
  module Endpoints
    class Channels::Entries < Endpoint

      def list(*args)
        arguments(args, :required => [:channel_id])

        response = get_request("/channels/#{channel_id}/entries", arguments.params)

        if block_given?
          response.each { |el| yield el }
        else
          return response
        end
      end
      alias :all :list

      def get(*args)
        arguments(args, :required => [:channel_id, :entry_id])

        get_request("/channels/#{channel_id}/entries/#{entry_id}", arguments.params)
      end
      alias :find :get

      def create(*args)
        arguments(args, :required => [:channel_id])

        post_request("/channels/#{channel_id}/entries", arguments.params, :with_attachments => true)
      end

      def update(*args)
        arguments(args, :required => [:channel_id, :entry_id])

        patch_request("/channels/#{channel_id}/entries/#{entry_id}", arguments.params, :with_attachments => true)
      end
      alias :edit :update

      def delete(*args)
        arguments(args, :required => [:channel_id, :entry_id])

        delete_request("/channels/#{channel_id}/entries/#{entry_id}", arguments.params)
      end
      alias :remove :delete


    end # Channel::Entries
  end # Endpoints
end # Nimbu
