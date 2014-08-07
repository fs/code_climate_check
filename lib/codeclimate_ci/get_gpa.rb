  class CodeclimateCi::GetGpa
    def initialize(api_requester, branch)
      @api_requester, @branch = api_requester, branch
    end

    def gpa
      retry_count.times do
        return last_snapshot_gpa if analyzed?
        wait_and_refresh!
      end

      0
    end

    private

    def wait_and_refresh!
      Messages.result_not_ready
      refresh!
      sleep(sleep_time)
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
      @branch_info ||= @api_requester.branch_info(@branch)
    end

    def refresh!
      @branch_info = nil
    end
  end
end
