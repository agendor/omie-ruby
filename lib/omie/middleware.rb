# frozen_string_literal: true

require "omie/middleware/authentication"

Faraday::Request.register_middleware(
  omie_authentication: -> { Omie::Middleware::Authentication }
)
