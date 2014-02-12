require 'spec_helper'

feature MedicalHistory do
  let(:user) { create(:user) }
  let(:patient) { create(:patient) }

  background { sign_in(user) }

  context "when signed in user can edit patient medical history" do
    scenario "can update allergies" do
      visit patient_path(patient)
      find('#medical-history').click
      select "Alcohol", from: "Allergies"
      click_on "Save"

      expect(page).to have_content("Changes saved.")
      expect(page).to have_content("Alcohol")
    end

    scenario "can update previous diseases" do
      visit patient_path(patient)
      find('#medical-history').click
      select "Measles", from: "Previous diseases"
      click_on "Save"

      expect(page).to have_content("Changes saved.")
      expect(page).to have_content('Measles')
    end

    scenario "can update medication and supplements" do
      visit patient_path(patient)
      find('#medical-history').click
      fill_in "Medication and Supplements", with: "Test"
      click_on "Save"

      expect(page).to have_content("Changes saved.")
      expect(page).to have_content("Test")
    end

    scenario "can update surgeries and hospitalization" do
      visit patient_path(patient)
      find('#medical-history').click
      fill_in "Surgeries and Hospitalization", with: "Test Test"
      click_on "Save"

      expect(page).to have_content("Changes saved.")
      expect(page).to have_content("Test Test")
    end

    scenario "can update family history of diseases" do
      visit patient_path(patient)
      find('#medical-history').click
      fill_in "Family history", with: "Test Test Test"
      click_on "Save"

      expect(page).to have_content("Changes saved.")
      expect(page).to have_content("Test Test Test")
    end
  end
end