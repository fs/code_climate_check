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

      if compare_gpa.worse?(branch_name)
        report_about_worse_code
        exit(1)
      else
        report_about_good_code
      end
    end

    default_task :check

    private

    def report_about_worse_code
      Report.worse_code(compare_gpa.diff(branch_name))
    end

    def report_about_good_code
      Report.good_code(compare_gpa.diff(branch_name))
    end

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
