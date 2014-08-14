module CodeclimateCi
  class Check
    def initialize
    end

    def code_became_worse?
      compare_gpa.worse?(branch_name)
    end

    def connection_established?
      api_requester.connection_established?
    end

    def diff
      compare_gpa.diff(branch_name)
    end

    private

    def compare_gpa
      @compare_gpa ||= CompareGpa.new(api_requester)
    end

    def api_requester
      @api_requester ||= ApiRequester.new(
        CodeclimateCi.configuration.codeclimate_api_token,
        CodeclimateCi.configuration.repo_id
      )
    end

    def branch_name
      CodeclimateCi.configuration.branch_name
    end
  end
end
