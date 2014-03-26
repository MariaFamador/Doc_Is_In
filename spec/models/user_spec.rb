require 'spec_helper'

describe User do
  let(:user) { create(:user) }
  subject { user }

  context "Validations" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_uniqueness_of(:email) }
    it { should ensure_length_of(:password).is_at_least(8) }
  end

  context "Associations" do
    it { should have_many(:patients) }
    it { should have_many(:appointments).dependent(:destroy) }
    it { should accept_nested_attributes_for(:appointments).allow_destroy(true) }
  end

  describe "email should be downcased before saving" do
    it "saves downcased email" do
      expect(user.email).to eq user.email.downcase
    end
  end
end
