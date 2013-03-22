# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nimbu-api/version'

Gem::Specification.new do |gem|
  gem.name          = "nimbu-api"
  gem.version       = Nimbu::VERSION
  gem.authors       = ["Peter Dedene"]
  gem.email         = ["support@nimbu.io"]
  gem.description   = %q{ The official Ruby wrapper around the Nimbu API. }
  gem.summary       = %q{ The official Ruby wrapper around the Nimbu API. }
  gem.homepage      = "http://www.nimbu.io"
  gem.license       = "MIT"

  gem.files         = `git ls-files`.split($/)
  gem.require_paths = ["lib"]

  gem.add_dependency 'hashie'
  gem.add_dependency 'faraday'
  gem.add_dependency 'multi_json'
  gem.add_dependency 'oauth2'

  gem.add_development_dependency "bundler", "~> 1.3"
  gem.add_development_dependency "rake"
  gem.add_development_dependency "awesome_print"
  gem.add_development_dependency 'pry'
  gem.add_development_dependency 'pry-remote'
  gem.add_development_dependency 'pry-stack_explorer'
  gem.add_development_dependency 'pry-debugger'
end
