require 'spec_helper'

describe CodeclimateCi::GetGpa do
  let(:codeclimate_ci) { CodeclimateCi::GetGpa.new(api_requester, 'repo1') }
  let(:api_requester) { double(CodeclimateCi::ApiRequester) }
  let(:configuration) { double(CodeclimateCi::Configuration, retry_count: '3', sleep_time: '5') }
  let(:analyzed_branch_info) { { 'last_snapshot' => { 'gpa' => 3 } } }
  let(:empty_branch_info) { '' }

  before { allow(CodeclimateCi).to receive(:configuration) { configuration } }

  context 'when task is analyzed' do
    before do
      allow(api_requester).to receive(:branch_info) { analyzed_branch_info }
      allow(api_requester.branch_info).to receive(:code).and_return(200)
    end

    it 'returns correct gpa value' do
      expect(codeclimate_ci.gpa).to eq 3
    end
  end

  context 'when task is not analyzed' do
    let(:configuration) do
      double(CodeclimateCi::Configuration, retry_count: '2', sleep_time: '0')
    end

    before do
      allow(api_requester).to receive(:branch_info) { empty_branch_info }
      allow(api_requester.branch_info).to receive(:code).and_return(200)
    end

    it 'returns correct gpa value' do
      expect(codeclimate_ci.gpa).to eq 0
    end
  end

  context 'when task analyzed after retry' do
    let(:configuration) do
      double(CodeclimateCi::Configuration, retry_count: '2', sleep_time: '0')
    end

    before do
      allow(api_requester).to receive(:branch_info).and_return(empty_branch_info, analyzed_branch_info)
    end

    it 'returns correct gpa value after retry' do
      expect(api_requester).to receive(:branch_info).twice
      allow(api_requester.branch_info).to receive(:code).and_return(200)
      expect(codeclimate_ci.gpa).to eq 3
    end
  end

  context 'when invalid credentials given' do
    let(:configuration) do
      double(CodeclimateCi::Configuration, retry_count: '2', sleep_time: '0')
    end

    before do
      allow(api_requester).to receive(:branch_info) { empty_branch_info }
      allow(api_requester.branch_info).to receive(:code).and_return(404)
      allow(CodeclimateCi::Report).to receive(:invalid_credentials)
      allow(codeclimate_ci).to receive(:exit)
    end

    it 'reports about invalid_credentials' do
      expect(CodeclimateCi::Report).to receive(:invalid_credentials)

      codeclimate_ci.gpa
    end

    it 'exites from script' do
      expect(codeclimate_ci).to receive(:exit)

      codeclimate_ci.gpa
    end
  end
end
