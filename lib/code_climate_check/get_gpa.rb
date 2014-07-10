require 'json'
require 'net/http'

module CodeClimateCheck
  class GetGpa
    ENDPOINT = 'https://codeclimate.com/api/repos/%{repo}/branches/%{branch}'
    NULL_GPA = 0

    def initialize(token, repo)
      @token, @repo = token, repo
    end

    def gpa_for(branch)
      response = get_http_response(branch)

      gpa(parse_json(fetch(response)))
    end

    private

    def parse_json(json_string)
      JSON.parse(json_string)
    end

    def gpa(json)
      if json.include?('last_snapshot')
        json['last_snapshot']['gpa'].to_f
      else
        NULL_GPA
      end
    end

    def fetch(response)
      if response.is_a?(successful_response)
        response.body
      else
        puts 'HTTP request have been failed'
        null_response
        exit(0)
      end
    end

    def uri(branch)
      URI(ENDPOINT % {repo: @repo, branch: branch}).tap do |uri|
        uri.query = URI.encode_www_form({api_token: @token})
      end
    end

    def null_response
      { last_snapshot: { gpa: NULL_GPA } }.to_json
    end

    def get_http_response(branch)
      Net::HTTP.get_response(uri(branch))
    end

    def successful_response
      Net::HTTPSuccess
    end
  end
end
