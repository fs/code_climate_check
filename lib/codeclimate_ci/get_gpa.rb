require 'timeout'

module CodeclimateCi
  class GetGpa
    def initialize(codeclimate_api, branch)
      @codeclimate_api, @branch = codeclimate_api, branch
    end

    def analyze!
      timeout(10) do
        until analyzed
          Messages.result_not_ready
          sleep(2)
          refresh!
        end

        gpa
      end
    end

    private

    def analyzed
      branch_info.include?('last_snapshot')
    end

    def gpa
      branch_info['last_snapshot']['gpa'].to_f
    end

    def refresh!
      @branch_info = nil
    end

    def branch_info
      @branch_info ||= @codeclimate_api.branch_info(@branch)
    end
  end
end
