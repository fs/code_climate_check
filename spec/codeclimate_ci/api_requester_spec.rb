require 'spec_helper'

module CodeclimateCi
  describe ApiRequester do
    let(:token) { 'abc123' }
    let(:repo_id) { '12345' }
    let(:api_requester) { CodeclimateCi::ApiRequester.new(token, repo_id) }

    before do
      allow(ApiRequester).to receive(:get)
    end

    it 'should receive Get method' do
      expect(ApiRequester).to receive(:get)

      api_requester.branch_info('hello')
    end
  end
end
