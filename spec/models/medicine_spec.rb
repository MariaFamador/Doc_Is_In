require 'spec_helper'

describe Medicine do
  context "Associations" do
    it { should have_many(:symptoms).through(:prescription_guides) }
    it { should have_many(:prescription_guides) }
    it { should have_many(:dosages) }
    it { should belong_to(:prescription) }
  end
end