require 'codeclimate_ci/version'
require 'codeclimate_ci/cli'
require 'codeclimate_ci/configuration'
require 'codeclimate_ci/compare_gpa'

module CodeclimateCi
  def self.configuration
    @configuration ||= Configuration.new
  end
end
