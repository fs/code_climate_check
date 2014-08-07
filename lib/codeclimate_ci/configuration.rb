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
    	options[option.to_s] || DEFAULTS[option.to_s]
    end
  end
end
