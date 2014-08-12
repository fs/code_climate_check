module CodeclimateCi
  class GetGpa
    NULL_VALUE = 0

    def initialize(api_requester, branch)
      @api_requester, @branch = api_requester, branch
    end

    def gpa
      retry_count.times do
        return last_snapshot_gpa if analyzed?
        fail(Exception) unless branch_info.code == 200
        wait_and_refresh!
      end

      NULL_VALUE

    rescue Exception
      Report.invalid_credentials
      exit(1)
    end

    private

    def wait_and_refresh!
      increment_retry_counter
      Report.result_not_ready(@retry_counter, @branch)
      refresh!
      sleep(sleep_time)
    end

    def increment_retry_counter
      @retry_counter ||= 0
      @retry_counter += 1
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
