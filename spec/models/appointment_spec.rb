require 'spec_helper'

describe Appointment do
  let(:user) { create(:user) }
  let(:patient) {create(:patient, user: user )}
  let(:appointment) { create(:appointment, user: user, patient: patient) }

  context "Validations" do
    it { should validate_presence_of(:starts_at_time) }
    it { should validate_presence_of(:starts_at_date) }
    it { should validate_presence_of(:starts_at) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:patient) }
    it { should validate_presence_of(:user) }
  end

  context "Associations" do
    it { should belong_to(:user) }
    it { should belong_to(:patient) }
  end

  describe "#update_starts_at" do 
    it "returns starts_at value from starts_at_time and starts_at_date" do
      starts_at_time = ("23 Jan 2014").to_time
      starts_at_date = ("23 Jan 2014").to_date

      expect(appointment.starts_at).to eq ("#{starts_at_date} #{starts_at_time}").to_datetime
    end
  end
end
