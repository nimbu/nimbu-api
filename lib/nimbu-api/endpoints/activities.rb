# encoding: utf-8
# frozen_string_literal: true

module Nimbu
  module Endpoints
    class Activities < Endpoint
      def get(*args)
        arguments(args, required: [:activity_id])

        get_request("/activities/#{activity_id}", arguments.params)
      end
      alias_method :find, :get
    end # Authorizations
  end # Endpoints
end # Nimbu
