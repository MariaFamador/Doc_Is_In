require 'spec_helper'

feature 'Registration' do
  scenario "Registration" do
    visit "/users/sign_up"

    fill_in "ACCOUNT NAME", with: "Test"
    select "Dental", from: "PRACTICE TYPE"
    fill_in "EMAIL", with: "foo@bar.com"
    fill_in "PASSWORD", with: "foobarz8", match: :prefer_exact
    fill_in "PASSWORD CONFIRMATION", with: "foobarz8"

    click_on "REGISTER"

    expect(page).to have_content "You have signed up successfully"
  end
end
