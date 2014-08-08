require 'spec_helper'

describe CodeclimateCi::ApiRequester do
  let(:token) { 'abc123' }
  let(:repo_id) { '12345' }
  let(:branch_name) { 'awesome_branch' }
  let(:api_requester) { CodeclimateCi::ApiRequester.new(token, repo_id) }
  let(:request_to_codeclimate) { api_requester.branch_info(branch_name) }
  let(:url_to_codeclimate) do
    "https://codeclimate.com/api/repos/#{repo_id}/branches/#{branch_name}?api_token=#{token}"
  end

  before { stub_request(:get, url_to_codeclimate).to_return(status: 200) }

  it 'should request to url correctly' do
    expect(request_to_codeclimate.code).to eq 200
  end
end
