# encoding: utf-8

module Nimbu
  module Endpoints
    class Videos < Endpoint

      def list(*args)
        arguments(args)

        response = get_request("/videos", arguments.params)
        return response unless block_given?
        response.each { |el| yield el }
      end
      alias :all :list

      def get(*args)
        arguments(args, :required => [:video_id])

        get_request("/videos/#{video_id}", arguments.params)
      end
      alias :find :get


    end # Authorizations
  end # Endpoints
end # Nimbu
