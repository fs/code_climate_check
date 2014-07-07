module CodeClimateCheck
  class CompareGpa < Base
    def diff(branch)
      branch_gpa(branch) - master_gpa
    end

    def worse?(branch)
      diff(branch) < 0
    end

    private

    def master_gpa
      gpa_for('master')
    end

    def branch_gpa(branch)
      gpa_for(branch)
    end

    def gpa_for(branch)
      gpa.gpa_for(branch)
    end

    def gpa
      @gpa ||= GetGpa.new(@token, @repo)
    end
  end
end