require 'spec_helper'

describe CodeclimateCi::CLI do
  let(:args) { ['--branch_name', 'master'] }

  let(:cli) { CodeclimateCi::CLI.new(args) }
  let(:api_requester) { double(CodeclimateCi::ApiRequester) }
  let(:compare_gpa) { double(CodeclimateCi::CompareGpa, diff: 0) }

  class FakeExit < Exception
  end

  def do_check
    cli.check
  rescue SystemExit => e
    raise FakeExit, e.status
  end

  before do
    allow(CodeclimateCi::ApiRequester).to receive(:new) { api_requester }
    allow(CodeclimateCi::CompareGpa).to receive(:new) { compare_gpa }
  end

  context 'when connection is not established' do
    before do
      allow(api_requester).to receive(:connection_established?) { false }
    end

    it 'reports invalid credentials' do
      expect(CodeclimateCi::Report).to receive(:invalid_credentials)
      expect { do_check }.to raise_error(FakeExit).with_message('1')
    end
  end

  context 'when connection is established' do
    before do
      allow(api_requester).to receive(:connection_established?) { true }
    end

    context 'when code is worse' do
      before do
        allow(compare_gpa).to receive(:worse?) { true }
      end

      it 'reports worse code' do
        expect(CodeclimateCi::Report).to receive(:worse_code)
        expect { do_check }.to raise_error(FakeExit).with_message('1')
      end
    end

    context 'when code is better' do
      before do
        allow(compare_gpa).to receive(:worse?) { false }
      end

      it 'reports good code' do
        expect(CodeclimateCi::Report).to receive(:good_code)
        expect { do_check }.to raise_error(FakeExit).with_message('0')
      end
    end
  end
end
