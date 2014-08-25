require 'git'

module CodeclimateCi
  class Configuration
    OPTIONS = %i(codeclimate_api_token repo_id branch_name retry_count sleep_time)
    DEFAULTS = {
      'retry_count' => '3',
      'sleep_time' => '5'
    }

    attr_accessor(*OPTIONS)

    def load_from_options(options)
      OPTIONS.each do |option|
        send("#{option}=", value_or_default(options, option))
      end
    end

    private

    def value_or_default(options, option)
      options[option.to_s] || default_values(option)
    end

    def default_values(option)
      DEFAULTS[option.to_s] || fetch_branch_from_env || fetch_branch_from_git
    end

    def fetch_branch_from_git
      git = Git.open('.')

      git.current_branch
    end

    def fetch_branch_from_env
      ENV['BRANCH_NAME']
    end
  end
end
