# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "nimbu-api/version"

Gem::Specification.new do |gem|
  gem.name          = "nimbu-api"
  gem.version       = Nimbu::API::VERSION
  gem.platform      = Gem::Platform::RUBY
  gem.authors       = ["Peter Dedene"]
  gem.email         = ["support@nimbu.io"]
  gem.summary       = "Ruby bindings for the Nimbu API"
  gem.description   = "Nimbu is the easiest way to build a beautiful multi-lingual online store! See http://nimbu.io for more information."
  gem.homepage      = "http://www.nimbu.io"
  gem.license       = "MIT"

  gem.files         = `git ls-files`.split($/)
  gem.require_paths = ["lib"]

  gem.required_ruby_version     = ">= 2.5.0"
  gem.required_rubygems_version = ">= 1.3.7"

  gem.add_dependency("excon")
  gem.add_dependency("faraday", "~> 0.15")
  gem.add_dependency("hashie")
  gem.add_dependency("marcel")
  gem.add_dependency("multi_json")
  gem.add_dependency("oauth2")

  gem.add_development_dependency("awesome_print")
  gem.add_development_dependency("bundler", "> 2.2.33")
  gem.add_development_dependency("pry")
  gem.add_development_dependency("pry-remote")
  gem.add_development_dependency("pry-stack_explorer")
  gem.add_development_dependency("rake")
  gem.add_development_dependency("rubocop")
  gem.add_development_dependency("rubocop-performance")
  gem.add_development_dependency("rubocop-shopify")
end
