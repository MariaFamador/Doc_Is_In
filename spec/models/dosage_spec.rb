require 'spec_helper'

describe Dosage do

  context "Associations" do
    it { should belong_to(:patient) }
    it { should belong_to(:medicine) }
  end
  
end 