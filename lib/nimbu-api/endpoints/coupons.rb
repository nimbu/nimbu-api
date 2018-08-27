# encoding: utf-8

module Nimbu
  module Endpoints
    class Coupons < Endpoint
      def list(*args)
        arguments(args)

        response = get_request("/coupons", arguments.params)
        return response unless block_given?
        response.each { |el| yield el }
      end
      alias :all :list

      def count(*args)
        arguments(args)

        get_request("/coupons/count", arguments.params)
      end

      def get(*args)
        arguments(args, :required => [:coupon_id])

        get_request("/coupons/#{coupon_id}", arguments.params)
      end
      alias :find :get

      def create(*args)
        arguments(args)

        post_request("/coupons", arguments.params)
      end

      def update(*args)
        arguments(args, :required => [:coupon_id])

        patch_request("/coupons/#{coupon_id}", arguments.params)
      end
      alias :edit :update

      def delete(*args)
        arguments(args, :required => [:coupon_id])

        delete_request("/coupons/#{coupon_id}", arguments.params)
      end
      alias :remove :delete

    end # Products
  end # Endpoints
end # Nimbu
