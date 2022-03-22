# encoding: utf-8
# frozen_string_literal: true

module Nimbu
  module Endpoints
    class Blogs::Articles < Endpoint
      def list(*args, &block)
        arguments(args, required: [:blog_id])

        response = get_request("/blogs/#{blog_id}/articles", arguments.params)

        if block_given?
          response.each(&block)
        else
          response
        end
      end
      alias_method :all, :list

      def first(*args)
        arguments(args, required: [:blog_id])

        get_request("/blogs/#{blog_id}/articles", arguments.params.merge(limit: 1)).first
      end

      def count(*args)
        arguments(args, required: [:blog_id])

        get_request("/blogs/#{blog_id}/articles/count", arguments.params)
      end

      def get(*args)
        arguments(args, required: [:blog_id, :article_id])

        get_request("/blogs/#{blog_id}/articles/#{article_id}", arguments.params)
      end
      alias_method :find, :get

      def create(*args)
        arguments(args, required: [:blog_id])

        post_request("/blogs/#{blog_id}/articles", arguments.params, with_attachments: true)
      end

      def update(*args)
        arguments(args, required: [:blog_id, :article_id])

        patch_request("/blogs/#{blog_id}/articles/#{article_id}", arguments.params, with_attachments: true)
      end
      alias_method :edit, :update

      def delete(*args)
        arguments(args, required: [:blog_id, :article_id])

        delete_request("/blogs/#{blog_id}/articles/#{article_id}", arguments.params)
      end
      alias_method :remove, :delete
    end # Blog::Articles
  end # Endpoints
end # Nimbu
