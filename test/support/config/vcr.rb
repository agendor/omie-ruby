# frozen_string_literal: true

require "vcr"

VCR.configure do |config|
  config.cassette_library_dir = "test/support/cassettes"
  config.hook_into :faraday
  config.ignore_localhost = true
  config.default_cassette_options = {
    match_requests_on: [:method, :uri, :body]
  }
end
