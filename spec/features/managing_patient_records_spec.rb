require 'spec_helper'

feature 'Managing patient records' do 
  let(:user) { create(:user) }
  let(:patient) { create(:patient, user: user) }
  let(:patient2) {create(:patient, user: user) }

  background { sign_in user }

  context "when managing patient records" do

    scenario "can create patients" do
      click_on "Patient Records"      
      click_on "Add Patient"
      expect(page).to have_content("Patient Record Form")
      fill_in "First name", with: "Maria"
      fill_in "Last name", with: "Famador"
      select "Female"
      select '23', from: "patient_dob_3i"
      select 'January', from: "patient_dob_2i"
      select '1990', from: "patient_dob_1i"
      fill_in "Address", with: "123 Sesame Street"
      fill_in "Phone number", with: "082-298-0909"
      click_on "Save"

      expect(page).to have_content("Record saved.")
    end

    scenario "can delete patient records", js: true do
      patient
      patient2

      click_on "Patient Records"
      click_on patient.full_name
      expect(page).to have_content(patient.address)
      click_on "Delete Record"

      expect(page).to have_content("Record deleted")
    end

    scenario "can edit patient records", js: true do
      patient
      click_on "Patient Records"
      click_on patient.full_name
      click_on "Edit Details"
      expect(page).to have_content("#{patient.full_name}")
      click_on "Save"

      expect(page).to have_content("Changes saved.")
    end
  end
end
