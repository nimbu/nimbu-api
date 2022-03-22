# encoding: utf-8
# frozen_string_literal: true

module Nimbu
  module Endpoints
    class Channels::Entries < Endpoint
      def list(*args, &block)
        arguments(args, required: [:channel_id])

        response = get_request("/channels/#{channel_id}/entries", arguments.params)

        if block_given?
          response.each(&block)
        else
          response
        end
      end
      alias_method :all, :list

      def first(*args)
        arguments(args, required: [:channel_id])

        get_request("/channels/#{channel_id}/entries", arguments.params.merge(limit: 1)).first
      end

      def list_deleted(*args)
        arguments(args, required: [:channel_id])

        get_request("/channels/#{channel_id}/entries/deleted", arguments.params)
      end
      alias_method :list_removed, :list_deleted

      def count(*args)
        arguments(args, required: [:channel_id])

        get_request("/channels/#{channel_id}/entries/count", arguments.params)
      end

      def get(*args)
        arguments(args, required: [:channel_id, :entry_id])

        get_request("/channels/#{channel_id}/entries/#{entry_id}", arguments.params)
      end
      alias_method :find, :get

      def create(*args)
        arguments(args, required: [:channel_id])

        post_request("/channels/#{channel_id}/entries", arguments.params, with_attachments: true)
      end

      def update(*args)
        arguments(args, required: [:channel_id, :entry_id])

        patch_request("/channels/#{channel_id}/entries/#{entry_id}", arguments.params, with_attachments: true)
      end
      alias_method :edit, :update

      def delete(*args)
        arguments(args, required: [:channel_id, :entry_id])

        delete_request("/channels/#{channel_id}/entries/#{entry_id}", arguments.params)
      end
      alias_method :remove, :delete
    end # Channel::Entries
  end # Endpoints
end # Nimbu
