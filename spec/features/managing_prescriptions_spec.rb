require 'spec_helper'

feature 'Managing Prescriptions' do
  let(:user) { create(:user) }
  let(:patient) { create(:patient, user: user) }
  let(:methotrexate) { create(:medicine) }
  let(:neozep) { create(:medicine, name: "Neozep") }
  let(:common_cold) { create(:symptom, name: "Common Cold") }
  let(:chills) { create(:symptom) }
  let(:prescription) { create(:prescription, patient: patient) }
  let(:other_prescription) { create(:prescription, patient: patient) }

  background { sign_in(user) }

  context "when user is signed in" do

    scenario "can create new prescriptions" do
      methotrexate
      neozep
      chills
      common_cold

      visit patient_path(patient, tab: "prescription")
      click_on "Create Prescription"
      fill_in "Diagnosis", with: "Test"

      select methotrexate.name, from: "Medicines"
      select neozep.name, from: "Medicines"
      select chills.name, from: "Symptoms"
      select common_cold.name, from: "Symptoms"

      click_on "Save"

      expect(page).to have_content("Prescription saved.")
    end

    scenario "can delete prescription", js: true do
      prescription
      other_prescription

      visit patient_path(patient, tab: "prescription")
      expect(Prescription.count).to eq 2
      find(:link, 'Delete', match: :first).click
      page.driver.browser.switch_to.alert.accept

      expect(Prescription.count).to eq 1
    end

    scenario "can view individual prescriptions", js: true do
      other_prescription

      visit patient_path(patient, tab: "prescription")
      find(:link, other_prescription.format_created_at, match: :first).click 
      
      expect(page).to have_content("Prescribed Medication")
      expect(page).to have_content("Date Issued")
    end
  end
end