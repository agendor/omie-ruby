# frozen_string_literal: true

module Omie
  module Middleware
    class Authentication
      attr_reader :app, :app_key, :app_secret

      def initialize(app, options = {})
        @app = app
        @app_key = options.fetch(:app_key)
        @app_secret = options.fetch(:app_secret)
      end

      def call(env)
        env[:body] = body_with_authentication(env[:body])

        app.call(env)
      end

      private

      def body_with_authentication(body)
        return body unless body.respond_to?(:merge)

        body.merge(
          app_key: app_key,
          app_secret: app_secret
        )
      end
    end
  end
end
