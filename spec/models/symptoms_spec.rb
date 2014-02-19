require 'spec_helper'

describe Symptom do
  context "Associations" do
    it { should have_many(:prescription_guides) }
    it { should have_many(:medicines).through(:prescription_guides) }
    it { should belong_to(:prescription) }
  end
end