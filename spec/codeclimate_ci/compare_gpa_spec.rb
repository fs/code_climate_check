require 'spec_helper'

module CodeclimateCi
  describe CompareGpa do
    let(:codeclimate_ci) { CodeclimateCi::CompareGpa.new('repo11', 'token1') }

    before do
      allow_any_instance_of(ApiRequester).to receive(:branch_info).with('master')
        .and_return(
          'last_snapshot' => { 'gpa' => 3 }
        )

      allow_any_instance_of(ApiRequester).to receive(:branch_info).with('another_branch')
        .and_return(
          'last_snapshot' => { 'gpa' => 2 }
        )
    end

    context 'when branch is analyzed' do
      it 'should not be worse' do
        expect(codeclimate_ci.worse?('another_branch')).to be_truthy
      end
    end
  end
end
