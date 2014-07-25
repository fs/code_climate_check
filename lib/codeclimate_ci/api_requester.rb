require 'httparty'

module CodeclimateCi
  class ApiRequester
    include HTTParty
    CODECLIMATE_URI =  'https://codeclimate.com/api/repos'

    def initialize(token, repo_id)
      self.class.base_uri "#{CODECLIMATE_URI}/#{repo_id}"
      self.class.default_params api_token: token
    end

    def branch_info(branch)
      self.class.get("/branches/#{branch}")
    end
  end
end
