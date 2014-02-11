require 'spec_helper'

describe Appointment do
  let(:appointment) { create(:appointment) }

  context "Validations" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:patient) }
    it { should validate_presence_of(:user) }

    context "if form is not equal to booking_form " do
      it { should_not validate_presence_of(:starts_at) }
      it { should_not validate_presence_of(:starts_at_time) }
      it { should_not validate_presence_of(:starts_at_date) }
    end

    context "if form is equal to booking_form" do

      before { appointment.form = "booking_form" }

      it { should validate_presence_of(:starts_at_date) }
      it { should validate_presence_of(:starts_at_time) }
    end
  end

  context "Associations" do
    it { should belong_to(:user) }
    it { should belong_to(:patient) }
  end

  describe "before validation" do
    it "saves starts_at from starts_at_time and starts_at_date" do
      appointment.starts_at_date = ("23 Jan 2014").to_date
      appointment.starts_at_time = ("9:30").to_time 
      appointment.form = "booking_form"

      appointment.save
      appointment.reload

      expect(appointment.starts_at).to eq "#{appointment.starts_at_date} #{appointment.starts_at_time}".to_datetime
    end
  end
end
