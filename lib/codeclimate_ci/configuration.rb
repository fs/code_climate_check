module CodeclimateCi
  class Configuration
    OPTIONS = %i(codeclimate_api_token repo_id branch_name)

    attr_accessor(*OPTIONS)

    def load_from_options(options)
      OPTIONS.each do |option|
        send("#{option}=", options[option.to_s])
      end
    end
  end
end
