module CodeclimateCi
  module Report
    module_function

    def result_not_ready(retry_count)
      puts "Failed to get GPA score from server. Retry #{retry_count}."
    end

    def branch_not_found(branch_name)
      puts "Oops. #{branch_name} branch analyze is not ready or branch does not exist"
    end

    def worse_code(gpa_diff)
      puts "Code in your branch became worse on #{rounded_diff_value(gpa_diff)} points"
    end

    def good_code(gpa_diff)
      puts "Gpa score has improved to #{rounded_diff_value(gpa_diff)} points. Go on..."
    end

    def invalid_credentials
      puts 'Invalid credentials given. Please check your codeclimate_api_token and repo_id.'
    end

    def rounded_diff_value(gpa_diff)
      gpa_diff.abs.round(2)
    end
  end
end
