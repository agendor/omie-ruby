# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "omie/version"

Gem::Specification.new do |spec|
  spec.name          = "omie-ruby"
  spec.version       = Omie::Version::STRING
  spec.authors       = ["Alexandre Saldanha", "Nathália Oliveira"]
  spec.email         = ["absaldanha@protonmail.com", "nathipsl@gmail.com"]
  spec.summary       = "An Omie API wrapper for Ruby"
  spec.license       = "MIT"

  spec.required_ruby_version = ">= 2.4.0"

  spec.metadata = {
    "source_code_uri" => "https://github.com/agendor/omie-ruby"
  }

  spec.files = Dir["lib/**/*"]

  spec.require_path = "lib"

  spec.add_dependency "faraday", "~> 1.0"
  spec.add_dependency "faraday_middleware", "~> 1.0"

  spec.add_development_dependency "minitest", "~> 5.14"
  spec.add_development_dependency "minitest-reporters", "~> 1.4"
  spec.add_development_dependency "pry-byebug", "~> 3.7"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rubocop", "0.82.0"
  spec.add_development_dependency "simplecov", "~> 0.18.5"
  spec.add_development_dependency "vcr", "~> 6.0"
end
