require 'spec_helper'

feature "Appointments" do 
  let(:user) { create(:user) }
  let(:patient) { create(:patient, user: user) }
  let(:appointment) { create(:appointment, user: user, patient: patient) }


  background { sign_in(user) }

  context "when user is signed in" do

    scenario "user can create appointments for patients" do
      patient

      visit dashboards_path
      click_on "Patient Records"
      expect(page).to have_content(patient.full_name)
      click_on "Book Appointment"
      fill_in "Appointment", with: "Thursday, 30 Jan, 2014"
      fill_in "Starts at time", with: "8:30"
      click_on "Save"

      expect(page).to have_content("Appointment booked.")
      expect(page).to have_content("Thursday, 30 Jan")
      expect(page).to have_content("8:30")
    end

    scenario "user can edit appointments for patients" do
      patient
      appointment

      visit dashboards_path
      click_on "Patient Records"
      click_on patient.full_name
      find("#patient-appointments").click
      find(".edit-appointment").click
      fill_in "Appointment", with: "Tuesday, 28 Jan, 2014"
      fill_in "Starts at time", with: "9:00"
      click_on "Save"

      expect(page).to have_content("Appointment booked.")
      expect(page).to have_content("Tuesday, 28 Jan")
      expect(page).to have_content("9:00")
    end

    scenario "user can cancel appointments for patients" do
      patient
      appointment

      visit dashboards_path
      click_on "Patient Records"
      click_on patient.full_name
      find("#patient-appointments").click
      find(".cancel-appointment").click

      expect(page).to have_content("Appointment cancelled.")
      expect(page).to have_content("Cancelled")
    end
  end

  context "appointment status" do

    scenario "date has passed" do
      appointment
    end

    xscenario "date is in the future" do
    end

    xscenario "date is cancelled" do  
    end
  end
end