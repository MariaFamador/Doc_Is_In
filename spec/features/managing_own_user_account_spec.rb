
require 'spec_helper'

feature "Managing it's own user account" do
  let(:user) { create(:user) }

  background { sign_in(user) }
  scenario "can update user profile" do
    click_on 'Settings'
    click_link "Edit Profile"
    expect(page).to have_content('Edit Profile')
    fill_in 'First name', with: user.first_name
    fill_in 'Last name', with: user.last_name 
    click_button 'Save Changes'

    expect(page).to have_content('Profile updated.')
  end

  xscenario "can change password" do
    click_on ('Settings')
    click_link "Security Settings"
    expect(page).to have_content("Edit Profile")

    fill_in 'New password', with: "password1"
    fill_in 'New password confirmation', with: "password1"
    fill_in 'Current password', with: "password"
    click_on 'Update'

    expect(page).to have_content("You updated your account successfully.")
  end

  scenario "can delete own account", js: true do
    click_on ('Settings')
    click_link "Security Settings"
    expect(page).to have_content("Edit Profile")
    click_on "Cancel my account"
    page.driver.browser.switch_to.alert.accept

    expect(page).to have_content("Sign in")
    end 
end