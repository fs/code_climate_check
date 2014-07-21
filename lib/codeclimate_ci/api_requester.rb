require 'httparty'

module CodeclimateCi
  class ApiRequester
    include HTTParty
    base_uri 'https://codeclimate.com/api/repos'

    def initialize(token, repo_id)
      self.class.base_uri "#{self.class.base_uri}/#{repo_id}"
      self.class.default_params api_token: token
    end

    def branch_info(branch)
      self.class.get("/branches/#{branch}")
    end
  end
end
