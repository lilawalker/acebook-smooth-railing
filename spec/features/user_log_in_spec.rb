require 'rails_helper'

RSpec.feature 'Users can sign up', type: :feature do
  xscenario 'Can sign up for an account' do
    sign_up
    click_link 'Log out'
    expect(current_path).to eq '/users/sign_in'
    fill_in 'user_email', with: 'ruby@rails.com'
    fill_in 'user_password', with: 'Password'
    click_button 'Log in'
    expect(current_path).to eq '/'
    expect(page).to have_content("Signed in successfully.")
  end
end
