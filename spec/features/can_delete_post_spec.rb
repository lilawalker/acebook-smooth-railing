require 'rails_helper'
require_relative '../support/post_helper.rb'

RSpec.feature 'Delete Post', type: :feature do
  xscenario 'user can delete their own post' do
    click_link 'Delete post'
    expect(page).not_to have_content 'This is a new post'
  end

  before(:each) do
    fake = FactoryBot.create(:user, :fake)
    log_in(fake)
    post = FactoryBot.create(:post)
    click_on(class:'logout-link')
    john = FactoryBot.create(:user, :john)
    log_in(john)
  end

  xscenario 'user gets error message trying to delete anothers post' do
    expect(page).to have_link 'Delete post'
    click_link 'Delete post'
    expect(page).to have_content 'You can only delete your own posts!'
  end

  xscenario 'user gets error message trying to edit anothers post' do
    expect(page).to have_link 'Edit post'
    click_link 'Edit post'
    expect(page).to have_content 'You can only edit your own posts!'
  end

end
