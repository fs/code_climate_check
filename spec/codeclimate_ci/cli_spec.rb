require 'spec_helper'

describe CodeclimateCi::CLI do
  let(:cli) { CodeclimateCi::CLI.new }
  let(:api_requester) { double(CodeclimateCi::ApiRequester) }
  let(:configuration) { double(CodeclimateCi::Configuration, retry_count: '3', sleep_time: '5') }
  let(:compare_gpa) { double(CodeclimateCi::CompareGpa) }

  before do
    allow(CodeclimateCi::ApiRequester).to receive(:new) { api_requester }
    allow(CodeclimateCi::CompareGpa).to receive(:new) { compare_gpa }
    allow(CodeclimateCi).to receive(:configuration) { configuration }
    allow(CodeclimateCi.configuration).to receive(:load_from_options)
    allow(CodeclimateCi.configuration).to receive(:codeclimate_api_token)
    allow(CodeclimateCi.configuration).to receive(:repo_id)
  end

  context 'when connection is not established' do
    before do
      allow(api_requester).to receive(:connection_established?) { false }
    end

    it 'exites from script' do
      -> { expect(cli.check).to raise_error SystemExit }
    end
  end

  context 'when connection is established' do
    before do
      allow(api_requester).to receive(:connection_established?) { true }
      allow(compare_gpa).to receive(:diff)
      allow(CodeclimateCi.configuration).to receive(:branch_name)
      allow(cli).to receive(:exit)
    end

    context 'when code in branch worse than master' do
      before do
        allow(compare_gpa).to receive(:worse?) { true }
        allow(CodeclimateCi::Report).to receive(:rounded_diff_value)
        allow(CodeclimateCi::Report).to receive(:worse_code)
      end

      it 'reports about worse code' do
        expect(CodeclimateCi::Report).to receive(:worse_code)

        cli.check
      end

      it 'exites from script' do
        expect(cli).to receive(:exit)

        cli.check
      end
    end

    context 'when code in branch worse than master' do
      before do
        allow(compare_gpa).to receive(:worse?) { false }
        allow(CodeclimateCi::Report).to receive(:good_code)
      end

      it 'reports about good code' do
        expect(CodeclimateCi::Report).to receive(:good_code)

        cli.check
      end
    end
  end
end
