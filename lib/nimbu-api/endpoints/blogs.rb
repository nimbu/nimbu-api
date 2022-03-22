# encoding: utf-8
# frozen_string_literal: true

module Nimbu
  module Endpoints
    class Blogs < Endpoint
      def articles(options = {}, &block)
        Nimbu::Builder.new("Blogs::Articles", current_options.merge(options), &block)
      end

      def list(*args, &block)
        arguments(args)

        response = get_request("/blogs", arguments.params)
        return response unless block_given?
        response.each(&block)
      end
      alias_method :all, :list

      def get(*args)
        arguments(args, required: [:blog_id])

        get_request("/blogs/#{blog_id}", arguments.params)
      end
      alias_method :find, :get

      def create(*args)
        arguments(args)

        post_request("/blogs", arguments.params)
      end

      def update(*args)
        arguments(args, required: [:blog_id])

        patch_request("/blogs/#{blog_id}", arguments.params)
      end
      alias_method :edit, :update

      def delete(*args)
        arguments(args, required: [:blog_id])

        delete_request("/blogs/#{blog_id}", arguments.params)
      end
      alias_method :remove, :delete
    end # Blogs
  end # Endpoints
end # Nimbu
