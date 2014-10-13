require 'spec_helper'

describe CodeclimateCi::Configuration do
  let(:configuration) { CodeclimateCi::Configuration.new }

  let(:options) do
    {
      'codeclimate_api_token' => '12345678',
      'repo_id' => '124356'
    }
  end

  describe '#load_from_options(options)' do
    context 'when branch_name given in options' do
      before do
        options.merge!('branch_name' => 'new-feature')

        configuration.load_from_options(options)
      end

      it 'properly setups options' do
        expect(configuration.codeclimate_api_token).to eq('12345678')
        expect(configuration.repo_id).to eq('124356')
        expect(configuration.branch_name).to eq('new-feature')
        expect(configuration.retry_count).to eq('3')
        expect(configuration.sleep_time).to eq('5')
      end
    end

    context 'when no branch_name given in options' do
      let(:current_branch) { `git rev-parse --abbrev-ref HEAD`.chomp }

      before do
        allow(ENV).to receive(:[]).with('BRANCH_NAME')

        configuration.load_from_options(options)
      end

      it 'properly setups branch option' do
        expect(configuration.branch_name).to eq current_branch
      end
    end
  end
end
