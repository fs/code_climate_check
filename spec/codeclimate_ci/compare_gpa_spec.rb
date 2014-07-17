require 'spec_helper'

module CodeclimateCi
  describe CompareGpa do
    let(:codeclimate_ci) { CodeclimateCi::CompareGpa.new('repo11', 'token1') }

    before do
      allow_any_instance_of(GetGpa).to receive(:gpa_for).and_return(1)
    end

    it 'should not be worse' do
      expect(codeclimate_ci.worse?('master')).to be_falsey
    end
  end
end
