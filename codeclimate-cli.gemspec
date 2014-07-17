# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'codeclimate/cli/version'


Gem::Specification.new do |spec|
  spec.name          = 'codeclimate-cli'
  spec.version       = Codeclimate::Cli::VERSION
  spec.authors       = ['FlatStack team']
  spec.summary       = %q{Simple gem for checking your code with CodeClimate}
  spec.description   = %q{Gem that allows You to check your code quality with CodeClimate right from your console}
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = ['codeclimate-cli']
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'

  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'guard'
  spec.add_development_dependency 'guard-rspec'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'pry-remote'
  spec.add_development_dependency 'pry-nav'
  spec.add_development_dependency 'rubocop'

  spec.add_dependency 'json', '~> 1.4'
end