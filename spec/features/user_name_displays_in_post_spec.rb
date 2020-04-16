require 'rails_helper'
require_relative '../support/post_helper.rb'

RSpec.feature 'posts', type: :feature do
  scenario 'user name displays on posts' do
    sign_up
    add_post('Hello, world!')
    expect(page).to have_content('rubytest')
  end
end
