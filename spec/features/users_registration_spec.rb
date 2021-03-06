require 'rails_helper'

RSpec.feature 'Users can sign up', type: :feature do
  scenario 'Can sign up for an account' do
    sign_up
    expect(current_path).to eq '/'
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end

  scenario 'Get redireted if they visit another URL without being signed in' do
    visit '/posts'
    expect(current_path).not_to eq '/posts'
    expect(current_path).to eq '/users/sign_in'
  end

  scenario 'Sees helpful message if email if not correct format' do
    visit '/'
    click_link 'Sign up'
    fill_in 'user_email', with: 'ruby'
    fill_in 'user_password', with: 'Password'
    fill_in 'user_password_confirmation', with: 'Password'
    click_button 'Sign up'
    expect(page).to have_content :alert
  end

  scenario 'Sees helpful message if password if not correct format' do
    visit '/'
    click_link 'Sign up'
    fill_in 'user_email', with: 'ruby@rails.com'
    fill_in 'user_password', with: '123'
    fill_in 'user_password_confirmation', with: '123'
    click_button 'Sign up'
    expect(page).to have_content :alert
  end
end
