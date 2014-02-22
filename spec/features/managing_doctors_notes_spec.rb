require 'spec_helper'
  
feature "Updating doctor's notes" do
  let(:user) { create(:user) }
  let(:patient) { create(:patient) }
  let(:appointment) { create(:appointment, user: user, patient: patient) }

  background { sign_in(user) }

  context "per appointment" do
    scenario "user can add doctor's notes" do
      patient
      appointment

      visit patient_path(patient)
      find('#doctors-notes').click
      fill_in "patient_appointments_attributes_0_notes", with: "Test"
      click_on "Update Patient"

      expect(page).to have_content("Test")
      expect(page).to have_content("Changes saved.")
    end
  end
end