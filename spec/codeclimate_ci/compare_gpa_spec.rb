require 'spec_helper'

module CodeclimateCi
  describe CompareGpa do
    let(:codeclimate_ci) { CodeclimateCi::CompareGpa.new('repo11', 'token1') }

    before do
      allow_any_instance_of(ApiRequester).to receive(:branch_info)
        .and_return(
          'last_snapshot' => { 'gpa' => 3 }
        )
    end

    context 'when branch is analyzed' do
      before { allow_any_instance_of(GetGpa).to receive(:gpa).and_return(1) }

      it 'should not be worse' do
        expect(codeclimate_ci.worse?('master')).to be_falsey
      end
    end

    context 'when branch is not analyzed' do
      before do
        allow_any_instance_of(GetGpa).to receive(:analyzed?).and_return(false)
        allow_any_instance_of(CLI).to receive(:result_not_ready)
        allow_any_instance_of(described_class).to receive(:sleep)
      end

      it 'should inform user about result' do
        expect(CLI).to receive(:result_not_ready).exactly(5).times

        codeclimate_ci.worse?('master')
      end
    end
  end
end
