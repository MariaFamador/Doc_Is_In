require 'spec_helper'

describe User do
  let(:user) { create(:user) }

  context "Validations" do    
    context 'when initial account details persisted' do
      subject { create(:user) }

      it { should validate_presence_of(:first_name) }
      it { should validate_presence_of(:last_name) }      
      it { should ensure_length_of(:first_name).is_at_most(50)}
      it { should ensure_length_of(:last_name).is_at_most(50)}
    end

    context "when new record" do 
      it { should_not validate_presence_of(:first_name) }
      it { should_not validate_presence_of(:last_name) }      
      it { should_not ensure_length_of(:first_name).is_at_most(50)}
      it { should_not ensure_length_of(:last_name).is_at_most(50)}
      it { should validate_presence_of(:email) }
      it { should validate_presence_of(:password) }
      it { should validate_presence_of(:password_confirmation) }
      it { should validate_uniqueness_of(:email) }
      it { should ensure_length_of(:password).is_at_least(8) }
      it { should ensure_length_of(:password_confirmation).is_at_least(8) }
    end 
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
