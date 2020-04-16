require 'rails_helper'
require_relative '../support/post_helpers.rb'

RSpec.feature 'Delete Post', type: :feature do
  scenario 'user can delete their own post' do
    expect(current_path).to eq '/posts'
    expect(page).to have_link 'Delete post'
    click_link 'Delete post'
    expect(page).not_to have_content 'This is a new post'
  end

  before(:each) do
    sign_up
    add_post('This is another users post')
  end

  scenario 'user gets error message trying to delete anothers post' do
    visit('/posts')
    expect(current_path).to eq '/posts'
    expect(page).to have_link 'Delete post'
    click_link 'Delete post'
    expect(page).to have_content 'You can only delete your own posts!'
  end

  scenario 'user gets error message trying to edit anothers post' do
    visit('/posts')
    expect(current_path).to eq '/posts'
    expect(page).to have_link 'Delete post'
    click_link 'Delete post'
    expect(page).to have_content 'You can only edit your own posts!'
  end

end
