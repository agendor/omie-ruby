# frozen_string_literal: true

require "test_helper"

class AuthenticationTest < Minitest::Test
  def setup
    @middleware = Omie::Middleware::Authentication.new(
      ->(env) { env[:body] },
      app_key: "key",
      app_secret: "secret"
    )
  end

  def test_call_set_credentials_with_hash_body
    env = { body: { some: "hash" } }

    assert_equal(
      { some: "hash", app_key: "key", app_secret: "secret" },
      @middleware.call(env)
    )
  end

  def test_call_does_nothing_with_string_body
    env = { body: "some body" }

    assert_equal "some body", @middleware.call(env)
  end
end
