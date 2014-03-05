module FeatureHelper

  def sign_in(user)
    visit new_user_session_path
    expect(page).to have_content('Sign in')
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'password'
    click_button 'Sign in'

    expect(page).to have_content('Welcome to the Home Page!')
  end

  def sign_out(user)
    click_on "Logout"
    expect(page).to have_content("Sign in")
    expect(page).to have_content("Signed out successfully.")
  end

  def page!
    save_and_open_page
  end
end

RSpec.configure do |config|
  config.include FeatureHelper, type: :feature
end
