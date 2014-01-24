require 'spec_helper'

feature 'Users' do 
  let(:user) { create(:user) }
  let(:patient) { create(:patient, user: user) }
  let(:patient2) {create(:patient, user: user) }

  background { sign_in user }

  scenario "updates profile" do
    click_on ('Settings')
    click_link "Edit Profile"
    expect(page).to have_content('Edit Profile')
    fill_in 'First name', with: user.first_name
    fill_in 'Last name', with: user.last_name 
    fill_in 'Role', with: 'doctor'
    click_button 'Save Changes'

    expect(page).to have_content('Profile updated.')
  end

  scenario "can create patients" do
    click_on "Patient Records"      
    click_on "Add Patient"
    expect(page).to have_content("Patient Form")
    fill_in "First name", with: "Maria"
    fill_in "Last name", with: "Famador"
    choose "Female"
    select '23', from: "patient_dob_3i"
    select 'January', from: "patient_dob_2i"
    select '1990', from: "patient_dob_1i"
    fill_in "Address", with: "123 Sesame Street"
    fill_in "Phone number", with: "082-298-0909"
    click_on "Save"

    expect(page).to have_content("Record saved.")
  end

  scenario "can delete patient records" do
    patient
    patient2

    click_on "Patient Records"
    click_on patient.full_name
    expect(page).to have_content(patient.address)
    click_on "Delete Record"

    expect(page).to have_content("Record deleted")
  end

  scenario "can edit patient records" do
    patient
    click_on "Patient Records"
    click_on patient.full_name
    click_on "Edit Details"
    expect(page).to have_content("Edit #{patient.full_name}'s Record")
    click_on "Save"

    expect(page).to have_content("Changes saved.")
  end

  # TODO: Set up elastic search for tests at
  # https://github.com/karmi/retire/wiki/Integration-Testing-Rails-Models-with-Tire
  # scenario "can search patient records" do
  #   patient
  #   patient2

  #   visit patients_path
  #   fill_in "query", with: patient.first_name
  #   click_on "Go"
  #   expect(page).to have_content(patient.full_name)
  # end
end
