require 'spec_helper'

feature "Searching Patients" do 
  pending

  # background { sign_in(user) }
  
  # context "when searching" do
  #   let!(:user) { create(:user) }
  #   let!(:patient1) { create(:patient, first_name: "Ana", middle_name: "Katrina", last_name: "Famador", user: user) }
  #   let!(:patient2) { create(:patient, first_name: "Maria", middle_name: "Regina", last_name: "Famador", user: user) }
  #   let!(:patient3) { create(:patient, first_name: "Rebecca", last_name: "Enciso", user: user) }

  #   scenario "using the complete first name" do
  #     patient1
  #     Patient.searchkick_index.refresh
  #     patient2
  #     Patient.searchkick_index.refresh
  #     patient3
  #     Patient.searchkick_index.refresh

  #     visit dashboards_path
  #     fill_in "query", with: "Famador"
  #     click_on "Go"

  #     expect(page).to have_content("Famador, Ana Katrina")
  #     # expect(page).to_not have_content("Maria Regina Famador")
  #     # expect(page).to_not have_content("Rebecca Enciso")
  #   end
  # end
end
