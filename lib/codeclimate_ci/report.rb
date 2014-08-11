module CodeclimateCi
  class Report
    def self.result_not_ready(retry_count, branch)
      puts "Retry #{retry_count}. #{branch} branch analyze is not ready or branch does not exist"
    end

    def self.worse_code(gpa_diff)
      puts "Code in your branch became worse on #{rounded_diff_value(gpa_diff)} points"
    end

    def self.good_code(gpa_diff)
      puts "Gpa score has improved to #{rounded_diff_value(gpa_diff)} points. Go on..."
    end

    def self.rounded_diff_value(gpa_diff)
      gpa_diff.abs.round(2)
    end
  end
end
