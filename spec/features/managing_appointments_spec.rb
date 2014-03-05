require 'spec_helper'

feature "Managing Appointments" do 
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
      fill_in "Date", with: "Thursday, 30 Jan, 2014"
      fill_in "Time", with: "8:30"
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
      fill_in "Date", with: "Tuesday, 28 Jan, 2014"
      fill_in "Time", with: "9:00"
      click_on "Save"

      expect(page).to have_content("Appointment changed.")
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

    scenario "user can delete appointments for patients" do
      patient
      appointment

      visit patient_path(patient)
      find('#patient-appointments').click
      click_on "Delete"

      expect(page).to have_content('Appointment deleted.')
    end
  end
end
