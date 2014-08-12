module CodeclimateCi
  class CompareGpa
    def initialize(api_requester)
      @api_requester = api_requester
    end

    def worse?(branch_name)
      diff(branch_name) < 0
    end

    def diff(branch_name)
      branch_gpa(branch_name) - master_gpa
    end

    private

    def master_gpa
      @master_gpa ||= gpa('master').gpa
    end

    def branch_gpa(branch_name)
      @branch_gpa ||= gpa(branch_name).gpa
    end

    def gpa(branch_name)
      GetGpa.new(@api_requester, branch_name)
    end
  end
end
