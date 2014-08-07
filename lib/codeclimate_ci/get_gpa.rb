module CodeclimateCi
  class GetGpa
    def initialize(codeclimate_api, branch)
      @codeclimate_api, @branch = codeclimate_api, branch
    end

    def gpa
      retrieve_branch_info
    end

    private

    def retrieve_branch_info
      retry_count.times do
        if analyzed?
          return last_snapshot_gpa
        else
          Messages.result_not_ready
          refresh!
          sleep(sleep_time)
        end
      end
    end

    def retry_count
      CodeclimateCi.configuration.retry_count.to_i
    end

    def sleep_time
      CodeclimateCi.configuration.sleep_time.to_i
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

    def refresh!
      @branch_info = nil
    end
  end
end
