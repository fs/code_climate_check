module CodeclimateCi
  module Report
    module_function

    def result_not_ready(retry_count, branch)
      puts "Retry #{retry_count}. #{branch} branch analyze is not ready or branch does not exist"
    end

    def worse_code(gpa_diff)
      puts "Code in your branch became worse on #{rounded_diff_value(gpa_diff)} points"

      url_to_branch
    end

    def good_code(gpa_diff)
      puts "Gpa score has improved to #{rounded_diff_value(gpa_diff)} points. Go on..."
    end

    def invalid_credentials
      puts 'Invalid credentials given. Please check your codeclimate_api_token and repo_id.'
    end

    def url_to_branch
      repo_id = CodeclimateCi.configuration.repo_id
      branch_name = CodeclimateCi.configuration.branch_name

      puts "https://codeclimate.com/repos/#{repo_id}/compare/#{branch_name}"
    end

    def rounded_diff_value(gpa_diff)
      gpa_diff.abs.round(2)
    end
  end
end
