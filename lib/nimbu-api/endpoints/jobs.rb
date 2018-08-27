# encoding: utf-8

module Nimbu
  module Endpoints
    class Jobs < Endpoint

      def schedule(*args)
        arguments(args, :required => [:job_id])

        post_request("/jobs/#{job_id}", arguments.params)
        return response
      end

    end # Simulator
  end # Endpoints
end # Nimbu
