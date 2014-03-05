require 'spec_helper'

describe Medicine do
  let(:medicine) { create(:medicine) }
  context "Associations" do
    it { should have_many(:symptoms).through(:prescription_guides) }
    it { should have_many(:prescription_guides) }
    it { should have_many(:dosages) }
    it { should belong_to(:prescription) }
  end

  context "Validations" do
    context "when form is equal to medicine_form" do
      subject do
        medicine.form = "medicine_form"
        medicine
      end

      it { should validate_presence_of(:name) }
    end
  end
end