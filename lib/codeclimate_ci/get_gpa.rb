module CodeclimateCi
  class GetGpa
    RETRY_COUNT = ENV['RETRY_COUNT'] || 3
    SLEEP_TIME = ENV['SLEEP_TIME'] || 5

    def initialize(codeclimate_api, branch)
      @codeclimate_api, @branch = codeclimate_api, branch
    end

    def gpa
      retrieve_branch_info
    end

    private

    def retrieve_branch_info
      RETRY_COUNT.times do
        if analyzed?
          return last_snapshot_gpa
        else
          Messages.result_not_ready
          sleep(SLEEP_TIME)
        end
      end
    end

    def last_snapshot_gpa
      branch_info['last_snapshot']['gpa'].to_f
    end

    def analyzed?
      branch_info.include?('last_snapshot')
    end

    def branch_info
      @branch_info ||= @codeclimate_api.branch_info(@branch)
    end
  end
end
