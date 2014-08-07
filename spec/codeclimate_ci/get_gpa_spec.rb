require 'spec_helper'

module CodeclimateCi
  describe GetGpa do
    let(:codeclimate_ci) { CodeclimateCi::GetGpa.new(api_requester, 'repo1') }
    let(:api_requester) { double(CodeclimateCi::ApiRequester) }
    let(:configuration) { double(CodeclimateCi::Configuration, retry_count: '3', sleep_time: '5')}

    before do
      allow(CodeclimateCi).to receive(:configuration) { configuration }
    end

    context 'when task is not analyzed' do
      before do
        allow(api_requester).to receive(:branch_info)
          .and_return(
            'last_snapshot' => { 'gpa' => 3 }
          )
      end

      it 'should return correct gpa value' do
        expect(codeclimate_ci.gpa).to eq 3
      end
    end
  end
end
