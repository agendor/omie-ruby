# frozen_string_literal: true

require "faraday"
require "omie/middleware"
require "omie/api"

module Omie
  class Client
    BASE_URL = "https://app.omie.com.br/api/v1"

    attr_reader :app_key, :app_secret

    def initialize(app_key: nil, app_secret: nil)
      @app_key = app_key || ENV.fetch("OMIE_APP_KEY")
      @app_secret = app_secret || ENV.fetch("OMIE_APP_SECRET")

      @conn = Faraday.new(BASE_URL) do |conn|
        conn.request :omie_authentication, app_key: @app_key,
          app_secret: @app_secret
        conn.request :json
        conn.response :json
      end
    end

    def customer
      @customer ||= API::Customer.new(conn)
    end

    def service_order
      @service_order ||= API::ServiceOrder.new(conn)
    end

    def service_invoice
      @service_invoice ||= API::ServiceInvoice.new(conn)
    end

    private

    attr_reader :conn
  end
end
