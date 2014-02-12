require 'spec_helper'

describe MedicalHistory do
  let(:patient) { create(:patient) }

  context "Validations" do
    it { should validate_presence_of(:patient_id) }
  end

  context "Associations" do
    it { should belong_to(:patient) }
  end
end