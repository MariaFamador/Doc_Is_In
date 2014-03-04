require 'spec_helper'

feature "Managing Medicines" do 
  let(:user) { create(:user) }
  let!(:methotrexate) { create(:medicine) }
  let!(:chills) { create(:symptom) }

  background { sign_in(user) }


  context "when user is signed in" do

    scenario "can create medicine" do
      visit medicines_path
      click_on "Add New Medicine"
      fill_in "Medicine", with: "Test"
      select chills.name, from: "Symptoms"
      click_on "Save"

      expect(page).to have_content("Record saved.")
      expect(Medicine.count).to eq 2
    end

    scenario "can edit medicine", js: true do
      visit medicines_path
      fill_in "Search medicine here", with: ""
      click_on "Go"
      click_on "Edit"

      fill_in "Medicine", with: "Testing Edit"
      click_on "Save"

      expect(page).to have_content("Changes saved.")
      expect(page).to have_content("Testing Edit")
    end

    scenario "can delete medicine", js: true do
      neozep = FactoryGirl.create(:medicine, name: "Neozep") 

      visit medicines_path
      fill_in "Search medicine here", with: ""
      click_on "Go"

      expect(Medicine.count).to eq 2
      find(:link, 'Delete', match: :first).click
      page.driver.browser.switch_to.alert.accept

      expect(Medicine.count).to eq 1
    end
  end
end