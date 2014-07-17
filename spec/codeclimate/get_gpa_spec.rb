require 'spec_helper'

module Codeclimate
  module Cli
    describe GetGpa do
      let(:codeclimate_cli) { Codeclimate::Cli::GetGpa.new('repo11', 'token1') }

      before do
        allow(Net::HTTP).to receive(:get_response)
        allow(Net::HTTP.get_response).to receive(:is_a?).and_return(true)
        allow(Net::HTTP.get_response).to receive(:body).and_return({ last_snapshot: { gpa: 3 } }.to_json)
      end

      it 'should return correct gpa value' do
        expect(codeclimate_cli.gpa_for('master')).to eq 3
      end
    end
  end
end
