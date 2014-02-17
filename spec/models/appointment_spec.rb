require 'spec_helper'

describe Appointment do
  let(:patient) { create(:patient) }
  let(:user) { create(:user) }
  let(:appointment) { create(:appointment, user: user, patient: patient) }

  context "Validations" do
    it { should validate_presence_of(:patient) }
    it { should validate_presence_of(:user) }

    context "when form is not equal to booking_form " do
      it { should_not validate_presence_of(:starts_at_time) }
      it { should_not validate_presence_of(:starts_at_date) }
    end

    context "when form is equal to booking_form" do
      subject do 
        appointment.form = "booking_form"
        appointment
      end
      it { should validate_presence_of(:starts_at_time)}
      it { should validate_presence_of(:starts_at_date)}
    end

    describe "when booking appointments" do
      context "booking times which are already taken" do
        it "should not be valid" do
          dup_appointment = build(:appointment, user: user, patient: patient, form: 'booking_form')
          dup_appointment.starts_at_date = appointment.format_date
          dup_appointment.starts_at_time = appointment.format_time
          dup_appointment.save

          expect(dup_appointment).to be_invalid
        end
      end

      context "booking times which have not been taken" do
        it "should be valid" do
          appointment2 = build(:appointment, user: user, patient: patient, form: 'booking_form')
          appointment2.starts_at_date = appointment.format_date
          appointment2.starts_at_time = Time.now
          appointment.save 

          expect(appointment2).to be_valid
        end
      end
    end
  end

  context "Associations" do
    it { should belong_to(:user) }
    it { should belong_to(:patient) }
  end

  context "before validation" do
    it "saves starts_at from starts_at_time and starts_at_date" do
      appointment.starts_at_date = ("23 Jan 2014").to_date
      appointment.starts_at_time = ("9:30").to_time 
      appointment.form = "booking_form"

      appointment.save
      appointment.reload

      expect(appointment.starts_at).to eq "#{appointment.starts_at_date} #{appointment.starts_at_time}".to_datetime
    end
  end

  describe "#format_date" do
    it "formats the appointment date" do
      expect(appointment.format_date).to eq "Thursday, 23 Jan"
    end
  end

  describe "#format_time" do
    it "formats the appointment time" do
      expect(appointment.format_time).to eq "09:30"
    end
  end

  describe "#status" do
    its "date has passed" do
      appointment.starts_at = Date.yesterday.to_datetime

      expect(appointment.status).to eq "Done"
    end

    its "date is in the future" do
      appointment.starts_at = (Date.today + 2.days).to_datetime
      expect(appointment.status).to eq "Pending"
    end

    its "date is cancelled" do  
      appointment.kancel

      expect(appointment.status).to eq "Cancelled"
    end
  end

  describe "#kancel" do
    its "cancel value is true" do
      appointment.kancel

      expect(appointment.cancel).to eq true
    end
  end
end
