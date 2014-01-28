# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nimbu-api/version'

Gem::Specification.new do |gem|
  gem.name          = "nimbu-api"
  gem.version       = Nimbu::API::VERSION
  gem.authors       = ["Peter Dedene"]
  gem.email         = ["support@nimbu.io"]
  gem.summary       = 'Ruby bindings for the Nimbu API'
  gem.description   = 'Nimbu is the easiest way to build a beautiful multi-lingual online store! See http://nimbu.io for more information.'
  gem.homepage      = "http://www.nimbu.io"
  gem.license       = "MIT"

  gem.files         = `git ls-files`.split($/)
  gem.require_paths = ["lib"]

  gem.add_dependency 'hashie'
  gem.add_dependency 'faraday', "0.8.9"
  gem.add_dependency 'multi_json'
  gem.add_dependency 'oauth2'
  gem.add_dependency 'excon'

  gem.add_development_dependency "bundler", "~> 1.3"
  gem.add_development_dependency "rake"
  gem.add_development_dependency "awesome_print"
  gem.add_development_dependency 'pry'
  gem.add_development_dependency 'pry-remote'
  gem.add_development_dependency 'pry-stack_explorer'
end
