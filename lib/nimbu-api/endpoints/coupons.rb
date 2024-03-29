# encoding: utf-8
# frozen_string_literal: true

module Nimbu
  module Endpoints
    class Coupons < Endpoint
      def list(*args, &block)
        arguments(args)

        response = get_request("/coupons", arguments.params)
        return response unless block_given?
        response.each(&block)
      end
      alias_method :all, :list

      def count(*args)
        arguments(args)

        get_request("/coupons/count", arguments.params)
      end

      def get(*args)
        arguments(args, required: [:coupon_id])

        get_request("/coupons/#{coupon_id}", arguments.params)
      end
      alias_method :find, :get

      def create(*args)
        arguments(args)

        post_request("/coupons", arguments.params)
      end

      def update(*args)
        arguments(args, required: [:coupon_id])

        patch_request("/coupons/#{coupon_id}", arguments.params)
      end
      alias_method :edit, :update

      def delete(*args)
        arguments(args, required: [:coupon_id])

        delete_request("/coupons/#{coupon_id}", arguments.params)
      end
      alias_method :remove, :delete
    end # Products
  end # Endpoints
end # Nimbu
