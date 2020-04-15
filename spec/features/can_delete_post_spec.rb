require 'rails_helper'
require_relative '../support/post_helpers.rb'

RSpec.feature 'Delete Post', type: :feature do
  scenario 'user can delete their own post' do
    sign_up
    add_post('This is a new post')
    expect(current_path).to eq '/posts'
    expect(page).to have_link 'Delete post'
    click_link 'Delete post'
    expect(page).not_to have_content 'This is a new post'
  end
end
