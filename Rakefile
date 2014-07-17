require 'bundler'
require 'bundler/gem_tasks'

Bundler.setup

require 'rake'
require 'rspec'
require 'rspec/core/rake_task'

$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'codeclimate-cli/version'

# Default directory to look in is `/specs`
# Run with `rake spec`
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
end

task default: :spec
task test: :spec
