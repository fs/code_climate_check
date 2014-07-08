require 'spec_helper'

module CodeClimateCheck
  describe CompareGpa do
    let(:code_climate_check) { CodeClimateCheck::CompareGpa.new('repo11', 'token1') }

    before do
      allow_any_instance_of(GetGpa).to receive(:gpa_for).and_return(1)
    end

    it 'should not be worse' do
      expect(code_climate_check.worse?('master')).to be_falsey
    end
  end
end
