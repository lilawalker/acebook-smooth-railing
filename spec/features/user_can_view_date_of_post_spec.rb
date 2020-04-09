# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can submit posts and view the date they were posted' do
    add_post('Hello, world!')
    date = Date.today
    expect(page).to have_content("Hello, world! #{date}")
  end
end
