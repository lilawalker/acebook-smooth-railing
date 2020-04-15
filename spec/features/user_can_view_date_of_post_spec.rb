require 'rails_helper'
require_relative '../support/post_helpers.rb'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can submit posts and view the date they were posted' do
    sign_up
    add_post('Hello, world!')
    date = Time.zone.today
    expect(page).to have_content(date)
  end
end
