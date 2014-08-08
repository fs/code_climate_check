require 'spec_helper'

describe CodeclimateCi::ApiRequester do
  let(:token) { 'token' }
  let(:repo_id) { 'repo-id' }
  let(:api_requester) { CodeclimateCi::ApiRequester.new(token, repo_id) }

  describe '#branch_info' do
    let(:branch) { 'master' }

    let(:endpoint) do
      "https://codeclimate.com/api/repos/#{repo_id}/branches/#{branch}?api_token=#{token}"
    end

    before do
      stub_request(:get, endpoint)
    end

    it 'requests correct API endpoint' do
      api_requester.branch_info(branch)
      expect(WebMock).to have_requested(:get, endpoint)
    end
  end
end
