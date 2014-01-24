require 'spec_helper'

feature "Appointments" do 
  let(:user) { create(:user) }
  let(:patient) { create(:patient, user: user) }
  let(:appointment) { create(:appointment, user: user, patient: patient) }


  background { sign_in(user) }

  context "when user is signed in" do

    scenario "user can create appointments for patients" do
      patient

      visit root_path
      click_on "Patient Records"
      expect(page).to have_content(patient.full_name)
      click_on "Book Appointment"
      fill_in "Appointment", with: "Thursday, 30 Jan, 2014"
      fill_in "Starts at time", with: "8:30"
      click_on "Save"

      expect(page).to have_content("Appointment booked.")
      expect(page).to have_content("Thursday, 30 JAN at 08:30")
    end

    scenario "user can edit appointments for patients" do
      patient
      appointment

      visit root_path
      click_on "Appointments"
      click_on "Edit Appointment"
      fill_in "Appointment", with: "Tuesday, 28 Jan, 2014"
      fill_in "Starts at time", with: "9:00"
      click_on "Save"

      expect(page).to have_content("Appointment booked.")
      expect(page).to have_content("Tuesday, 28 JAN at 09:00")
    end

    scenario "user can delete appointments for patients" do
      patient
      appointment

      visit root_path
      click_on "Appointments"
      click_on "Cancel"

      expect(page).to have_content("Appointment cancelled.")
    end
  end
end