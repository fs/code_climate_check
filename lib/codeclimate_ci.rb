require 'codeclimate_ci/version'
require 'codeclimate_ci/cli'
require 'codeclimate_ci/configuration'
require 'codeclimate_ci/get_gpa'
require 'codeclimate_ci/compare_gpa'
require 'codeclimate_ci/api_requester'
require 'codeclimate_ci/report'

module CodeclimateCi
  def self.configuration
    @configuration ||= Configuration.new
  end
end
