# encoding: utf-8
require File.expand_path('../lib/codeclimate_ci/version', __FILE__)

Gem::Specification.new do |spec|
  spec.name          = 'codeclimate_ci'
  spec.version       = CodeclimateCi::VERSION
  spec.authors       = ['FlatStack team']
  spec.summary       = %q{Simple gem for checking your code with CodeClimate}
  spec.description   = %q{ Gem that allows You to check your code quality with CodeClimate and integrate it with your CI scripts }
  spec.license       = 'MIT'
  spec.homepage    = 'https://github.com/fs/codeclimate_ci'
  spec.email       = 'fs-admin@flatstack.com'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = ['codeclimate_ci']
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake', '~> 10.3'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'pry', '~> 0.10'
  spec.add_development_dependency 'rubocop', '~> 0.25'
  spec.add_development_dependency 'webmock', '~> 1.18'

  spec.add_dependency 'thor', '~> 0.19'
  spec.add_dependency 'httparty', '~>  0.13'
end
