require 'codeclimate_ci/get_gpa'

module CodeclimateCi
  class CompareGpa
    def initialize(token, repo_id)
      @token, @repo_id = token, repo_id
    end

    def diff(branch_name)
      branch_gpa(branch_name) - master_gpa
    end

    def worse?(branch_name)
      diff(branch_name) < 0
    end

    private

    def master_gpa
      gpa('master').analyze!
    end

    def branch_gpa(branch_name)
      gpa(branch_name).analyze!
    end

    def api_requester
      @api_requester ||= ApiRequester.new(@token, @repo_id)
    end

    def gpa(branch_name)
      GetGpa.new(api_requester, branch_name)
    end
  end
end
