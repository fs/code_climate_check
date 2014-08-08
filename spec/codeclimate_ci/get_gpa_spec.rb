require 'spec_helper'

describe CodeclimateCi::GetGpa do
  let(:codeclimate_ci) { CodeclimateCi::GetGpa.new(api_requester, 'repo1') }
  let(:api_requester) { double(CodeclimateCi::ApiRequester) }
  let(:configuration) { double(CodeclimateCi::Configuration, retry_count: '3', sleep_time: '5') }
  let(:analyzed_branch_info) { { 'last_snapshot' => { 'gpa' => 3 } } }
  let(:empty_branch_info) { '' }

  before { allow(CodeclimateCi).to receive(:configuration) { configuration } }

  context 'when task is analyzed' do
    before { allow(api_requester).to receive(:branch_info) { analyzed_branch_info } }

    it 'returns correct gpa value' do
      expect(codeclimate_ci.gpa).to eq 3
    end
  end

  context 'when task is not analyzed' do
    let(:configuration) { double(CodeclimateCi::Configuration, retry_count: '2', sleep_time: '0') }

    before { allow(api_requester).to receive(:branch_info) { empty_branch_info } }

    it 'returns correct gpa value' do
      expect(codeclimate_ci.gpa).to eq 0
    end
  end

  context 'when task analyzed after retry' do
    let(:configuration) { double(CodeclimateCi::Configuration, retry_count: '2', sleep_time: '0') }

    before { allow(api_requester).to receive(:branch_info).and_return(empty_branch_info, analyzed_branch_info) }

    it 'returns correct gpa value after retry' do
      expect(api_requester).to receive(:branch_info).twice
      expect(codeclimate_ci.gpa).to eq 3
    end
  end
end
