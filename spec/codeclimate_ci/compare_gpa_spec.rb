require 'spec_helper'

module CodeclimateCi
  describe CompareGpa do
    let(:codeclimate_ci) { CodeclimateCi::CompareGpa.new(api_requester) }
    let(:api_requester) { double(CodeclimateCi::ApiRequester) }
    let(:configuration) { double(CodeclimateCi::Configuration, retry_count: '2', sleep_time: '1') }
    let(:good_branch_info) { { 'last_snapshot' => { 'gpa' => '4' } } }
    let(:bad_branch_info) { { 'last_snapshot' => { 'gpa' => '1' } } }

    before do
      allow(CodeclimateCi).to receive(:configuration) { configuration }
      allow(api_requester).to receive(:branch_info).with('master') { good_branch_info }
      allow(api_requester).to receive(:branch_info).with('another_branch') { bad_branch_info }
    end

    it 'properly defines branch with worse code quality' do
      expect(codeclimate_ci.worse?('another_branch')).to be_truthy
    end
  end
end
