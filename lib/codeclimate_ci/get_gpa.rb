require 'timeout'

module CodeclimateCi
  class GetGpa
    RETRY_TIMEOUT = ENV['RETRY_TIMEOUT'] || 10
    NO_BRANCH_INFO_ERROR = Class.new(Exception)

    def initialize(codeclimate_api, branch)
      @codeclimate_api, @branch = codeclimate_api, branch
    end

    def gpa
      branch_info['last_snapshot']['gpa'].to_f
    end

    private

    def branch_info
      @branch_info ||= timeout(RETRY_TIMEOUT) { retrieve_branch_info }
    end

    def retrieve_branch_info
      info = @codeclimate_api.branch_info(@branch)
      fail(NO_BRANCH_INFO_ERROR) unless info.include?('last_snapshot')

      info
    rescue NO_BRANCH_INFO_ERROR
      sleep(2) && retry
    end
  end
end
