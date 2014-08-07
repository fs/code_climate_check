require 'spec_helper'

module CodeclimateCi
  describe Configuration do
    let(:options) do
      {
        'codeclimate_api_token' => '12345678',
        'repo_id' => '124356',
        'branch_name' => 'new-feature'
      }
    end

    let(:configuration) { CodeclimateCi::Configuration.new }

    describe '#load_from_options(options)' do
      before do
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
  end
end
