require 'spec_helper'

describe Prescription do

  context "Associations" do
    it { should have_many(:medicines) }
    it { should have_many(:symptoms) }
    it { should belong_to(:patient) }
    it { should belong_to(:user) }
  end

  context "Validations" do
    it { should validate_presence_of(:diagnosis) }
  end
end