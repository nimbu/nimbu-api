# encoding: utf-8

module Nimbu
  module Endpoints
    class Authorizations < Endpoint

      VALID_AUTH_PARAM_NAMES = %w[
        scopes
        add_scopes
        remove_scopes
        note
        note_url
        client_id
        client_secret
      ].freeze

      # List authorizations
      #
      # = Examples
      #  nimbu = Nimbu.new :basic_auth => 'login:password'
      #  nimbu.oauth.list
      #  nimbu.oauth.list { |auth| ... }
      #
      def list(*args)
        require_authentication
        arguments(args)

        response = get_request("/authorizations", arguments.params)
        return response unless block_given?
        response.each { |el| yield el }
      end
      alias :all :list

      # Get a single authorization
      #
      # = Examples
      #  nimbu = Nimbu.new :basic_auth => 'login:password'
      #  nimbu.oauth.get 'authorization-id'
      #
      def get(*args)
        require_authentication
        arguments(args, :required => [:authorization_id])

        get_request("/authorizations/#{authorization_id}", arguments.params)
      end
      alias :find :get

      # Create a new authorization
      #
      # = Inputs
      # * <tt>:scopes</tt> - Optional array - A list of scopes that this authorization is in.
      # * <tt>:note</tt> - Optional string - A note to remind you what the OAuth token is for.
      # * <tt>:note_url</tt> - Optional string - A URL to remind you what the OAuth token is for.
      #
      # = Examples
      #  nimbu = Nimbu.new :basic_auth => 'login:password'
      #  nimbu.oauth.create
      #    "scopes" => ["public_repo"]
      #
      def create(*args)
        require_authentication
        arguments(args) do
          sift VALID_AUTH_PARAM_NAMES
        end

        post_request("/authorizations", arguments.params)
      end

      # Update an existing authorization
      #
      # = Inputs
      # * <tt>:scopes</tt> - Optional array - A list of scopes that this authorization is in.
      # * <tt>:add_scopes</tt> - Optional array - A list of scopes to add to this authorization.
      # * <tt>:remove_scopes</tt> - Optional array - A list of scopes to remove from this authorization.
      # * <tt>:note</tt> - Optional string - A note to remind you what the OAuth token is for.
      # * <tt>:note_url</tt> - Optional string - A URL to remind you what the OAuth token is for.
      #
      # = Examples
      #  nimbu = Nimbu.new :basic_auth => 'login:password'
      #  nimbu.oauth.update "authorization-id", "add_scopes" => ["repo"],
      #
      def update(*args)
        require_authentication
        arguments(args, :required => [:authorization_id]) do
          sift VALID_AUTH_PARAM_NAMES
        end

        patch_request("/authorizations/#{authorization_id}", arguments.params)
      end
      alias :edit :update

      # Delete an authorization
      #
      # = Examples
      #  nimbu.oauth.delete 'authorization-id'
      #
      def delete(*args)
        require_authentication
        arguments(args, :required => [:authorization_id])

        delete_request("/authorizations/#{authorization_id}", arguments.params)
      end
      alias :remove :delete

      private

      def require_authentication
        raise ArgumentError, 'You can only access authentication tokens through Basic Authentication' unless authenticated?
      end

    end # Authorizations
  end # Endpoints
end # Nimbu
