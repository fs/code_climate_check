require 'thor'

module CodeclimateCi
  class CLI < Thor
    method_option :codeclimate_api_token, required: true
    method_option :repo_id, required: true
    method_option :branch_name, required: true
    method_option :retry_count
    method_option :sleep_time

    desc('check', 'Check code quality with CodeClimate')

    def check
      CodeclimateCi.configuration.load_from_options(options)

      bad_connection unless branch_check.connection_established?
      worse_code if branch_check.code_became_worse?
      good_code
    end

    default_task :check

    private

    def worse_code
      Report.worse_code(branch_diff)
      exit(1)
    end

    def good_code
      Report.good_code(branch_diff)
    end

    def bad_connection
      Report.invalid_credentials
      exit(1)
    end

    def branch_diff
      branch_check.diff
    end

    def branch_check
      @branch_check ||= Check.new
    end
  end
end
