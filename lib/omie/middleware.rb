# frozen_string_literal: true

require "faraday_middleware"
require "omie/middleware/authentication"

Faraday::Request.register_middleware(
  omie_authentication: -> { Omie::Middleware::Authentication }
)
