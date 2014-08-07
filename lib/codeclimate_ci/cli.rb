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

      if CompareGpa.new(codeclimate_api_token, repo_id).worse?(branch_name)
        Messages.for_worse_code
        exit(1)
      else
        Messages.for_good_code
      end
    end

    default_task :check

    private

    def codeclimate_api_token
      CodeclimateCi.configuration.codeclimate_api_token
    end

    def repo_id
      CodeclimateCi.configuration.repo_id
    end

    def branch_name
      CodeclimateCi.configuration.branch_name
    end
  end
end
