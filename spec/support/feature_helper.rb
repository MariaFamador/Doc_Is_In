module FeatureHelper

  def sign_in(user)
    visit new_user_session_path
    expect(page).to have_content('Sign in')
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'password'
    click_button 'Sign in'

    expect(page).to have_content('Signed in successfully.')
  end
end

RSpec.configure do |config|
  config.include FeatureHelper, type: :feature
end
