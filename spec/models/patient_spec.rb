require 'spec_helper'

describe Patient do
  let(:patient) { create(:patient) }

  context 'Validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:dob) }
    it { should validate_presence_of(:gender) }

    it { should ensure_length_of(:first_name).is_at_most(50) }
    it { should ensure_length_of(:last_name).is_at_most(50) }
  end

  context 'Associations' do
    it { should belong_to(:user) }
    it { should have_many(:appointments).dependent(:destroy) }
    it { should accept_nested_attributes_for(:appointments).allow_destroy(true) }
  end

  describe "#age" do
    it "returns current age" do
      expect(patient.age).to eq (Date.today.year - patient.dob.year)
    end
  end

  describe "#full_name" do
    it "returns full name when middle name is present" do
      patient.first_name = "Foo"
      patient.middle_name = "Bar"
      patient.last_name = "Baz"

      expect(patient.full_name).to eq "Baz, Foo Bar"
    end    

    it "returns full name when middle name is blank" do
      patient.first_name = "Foo"
      patient.middle_name = ""
      patient.last_name = "Baz"

      expect(patient.full_name).to eq "Baz, Foo"
    end
  end
end
