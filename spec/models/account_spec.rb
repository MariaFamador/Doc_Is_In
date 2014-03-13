require 'spec_helper'

describe Account do
  context "Associations" do
    it { should have_many(:roles) }
    it { should have_many(:users).through(:roles) }
  end

  context "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:type) }
    it { should validate_uniqueness_of(:slug) }
  end
end