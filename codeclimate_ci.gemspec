# encoding: utf-8
require File.expand_path('../lib/codeclimate_ci/version', __FILE__)

Gem::Specification.new do |spec|
  spec.name          = 'codeclimate_ci'
  spec.version       = CodeclimateCi::VERSION
  spec.authors       = ['FlatStack team']
  spec.summary       = %q{Simple gem for checking your code with CodeClimate}
  spec.description   = %q{ Gem that allows You to check your code quality with CodeClimate and integrate it with your CI scripts }
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = ['codeclimate_ci']
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'webmock'

  spec.add_dependency 'thor'
  spec.add_dependency 'httparty'
end
